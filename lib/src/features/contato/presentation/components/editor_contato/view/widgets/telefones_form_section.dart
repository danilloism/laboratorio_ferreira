import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/helpers.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/misc/helpers/editor_contato_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/editor_telefone_dialog.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class TelefonesFormSection extends ConsumerWidget {
  const TelefonesFormSection({super.key});

  bool _podeEditarTelefone(WidgetRef ref) {
    final editorContato = ref.read(editorContatoNotifierProvider);
    final usuarioLogado = ref.read(settingsNotifierProvider).session!.contato;

    return EditorContatoHelper.usuarioLogadoPodeEditarContato(
        usuarioLogado: usuarioLogado, contatoSendoEditado: editorContato);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podeEditarTelefone = _podeEditarTelefone(ref);
    return FormField<Set<String>>(
      initialValue: ref.read(editorContatoNotifierProvider).telefones,
      validator: (value) => value == null || value.isEmpty
          ? 'Contato deve possuir pelo menos um telefone.'
          : null,
      builder: (formFieldState) => FormSection(
        title: 'Telefone(s)',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, _) {
                ref.listen(
                    editorContatoNotifierProvider
                        .select((value) => value.telefones), (_, next) {
                  formFieldState.didChange(next);
                });
                final telefonesState = ref.watch(editorContatoNotifierProvider
                    .select((value) => value.telefones));
                return CustomWrap(
                  children: [
                    ...telefonesState.map(
                      (telefone) => CustomChip(
                        key: ValueKey('chip-$telefone'),
                        label: Text(Formatter.applyPhoneMask(telefone)),
                        onPressed: podeEditarTelefone
                            ? () => context.openModal(
                                EditorTelefoneDialog(telefone: telefone))
                            : null,
                        onDeleted: podeEditarTelefone
                            ? () => ref
                                .read(editorContatoNotifierProvider.notifier)
                                .removerTelefone(telefone)
                            : null,
                        tooltip: podeEditarTelefone ? 'Editar telefone' : null,
                      ),
                    ),
                    if (podeEditarTelefone)
                      CustomChip.add(
                          () => context.openModal(EditorTelefoneDialog())),
                  ],
                );
              },
            ),
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  formFieldState.errorText!,
                  style: TextStyle(
                    color: context.theme.colorScheme.error,
                    fontSize: 12.5,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
