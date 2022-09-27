import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:mask/mask.dart';

class EditorTelefoneDialog extends StatelessWidget {
  const EditorTelefoneDialog({super.key, this.telefone});

  final String? telefone;

  void _submit({
    required bool isEditar,
    required TelefoneInput input,
    required BuildContext context,
    required String initialValue,
  }) {
    if (!input.valid) return;

    final telefone = input.value;
    if (isEditar) {
      EditorContatoCubit.of(context).alterarTelefone(
        currentValue: initialValue,
        newValue: telefone,
      );
    } else {
      EditorContatoCubit.of(context).adicionarTelefone(telefone);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditorTelefoneCubit(telefone),
      child: Builder(builder: (context) {
        final telefoneInitialValue =
            EditorTelefoneCubit.of(context).state.value;
        final isEditar = telefoneInitialValue.isNotEmpty;
        return AlertDialog(
          title: isEditar
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Alterar telefone'),
                    IconButton(
                      onPressed: () {
                        EditorContatoCubit.of(context)
                            .removerTelefone(telefoneInitialValue);
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
            BlocBuilder<EditorTelefoneCubit, TelefoneInput>(
                buildWhen: (previous, current) =>
                    current.valid || previous.valid && !current.valid,
                builder: (context, state) => ElevatedButton(
                    onPressed: !state.valid
                        ? null
                        : () => _submit(
                              isEditar: isEditar,
                              input: state,
                              context: context,
                              initialValue: telefoneInitialValue,
                            ),
                    child: isEditar
                        ? const Text('Alterar')
                        : const Text('Adicionar')))
          ],
          content: BlocBuilder<EditorTelefoneCubit, TelefoneInput>(
            builder: (ctx, state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  initialValue: telefoneInitialValue.isEmpty
                      ? null
                      : Formatter.applyPhoneMask(telefoneInitialValue),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _submit(
                    isEditar: isEditar,
                    input: state,
                    context: context,
                    initialValue: telefoneInitialValue,
                  ),
                  inputFormatters: [
                    Mask.generic(masks: ['(##) #####-####'])
                  ],
                  onChanged: (value) {
                    EditorTelefoneCubit.of(context)
                        .teveAlteracao(Formatter.unmaskPhone(value));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Visibility(
                    visible: state.error != null && !state.pure,
                    child: Text(state.error?.name ?? '',
                        style: const TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
