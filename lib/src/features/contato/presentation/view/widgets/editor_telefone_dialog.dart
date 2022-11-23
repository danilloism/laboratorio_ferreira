import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/telefone_notifier.dart';
import 'package:mask/mask.dart';

class EditorTelefoneDialog extends ConsumerWidget {
  EditorTelefoneDialog({super.key, String? telefone})
      : initialValue = telefone ?? '' {
    telefoneProvider = telefoneNotifierProvider(telefone);
  }

  final String initialValue;
  late final AutoDisposeStateNotifierProvider<TelefoneNotifier, TelefoneInput>
      telefoneProvider;

  void _submit({
    required bool isEditar,
    required TelefoneInput input,
    required WidgetRef ref,
    required BuildContext context,
    // required String initialValue,
  }) {
    if (!input.valid) return;

    final notifier = ref.read(editorContatoNotifierProvider.notifier);
    final telefone = input.value;
    if (isEditar) {
      notifier.alterarTelefone(
        currentValue: initialValue,
        newValue: telefone,
      );
    } else {
      notifier.adicionarTelefone(telefone);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(builder: (context) {
      final isEditar = initialValue.isNotEmpty;
      return AlertDialog(
        title: isEditar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Alterar telefone'),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(editorContatoNotifierProvider.notifier)
                          .removerTelefone(initialValue);
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.trash),
                    color: Colors.red,
                    padding: const EdgeInsets.all(0),
                  ),
                ],
              )
            : const Center(child: Text('Adicionar telefone')),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          Consumer(
            builder: (context, ref, child) {
              final telefoneState = ref.watch(telefoneProvider);
              return ElevatedButton(
                  onPressed: !telefoneState.valid
                      ? null
                      : () => _submit(
                          isEditar: isEditar,
                          input: telefoneState,
                          context: context,
                          ref: ref
                          // initialValue: telefoneInitialValue,
                          ),
                  child: isEditar
                      ? const Text('Alterar')
                      : const Text('Adicionar'));
            },
          ),
        ],
        content: Consumer(
          builder: (context, ref, child) {
            final telefoneState = ref.watch(telefoneProvider);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  initialValue: initialValue.isEmpty
                      ? null
                      : Formatter.applyPhoneMask(initialValue),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _submit(
                    isEditar: isEditar,
                    ref: ref,
                    input: telefoneState,
                    context: context,
                  ),
                  inputFormatters: [
                    Mask.generic(masks: ['(##) #####-####'])
                  ],
                  onChanged: (value) {
                    ref
                        .read(telefoneProvider.notifier)
                        .teveAlteracao(Formatter.unmaskPhone(value));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Visibility(
                    visible: telefoneState.error != null && !telefoneState.pure,
                    child: Text(telefoneState.error?.name ?? '',
                        style: const TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
