import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/helpers.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/misc/helpers/editor_contato_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/editor_telefone_dialog.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class TelefonesFormSection extends ConsumerWidget {
  const TelefonesFormSection({super.key});

  bool _podeEditarTelefone(WidgetRef ref) {
    final editorContato = ref.read(editorContatoNotifierProvider);
    final usuarioLogado = ref.read(settingsControllerProvider).session!.contato;

    return EditorContatoHelper.usuarioLogadoPodeEditarContato(
        usuarioLogado: usuarioLogado, contatoSendoEditado: editorContato);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podeEditarTelefone = _podeEditarTelefone(ref);
    return FormBuilderField<Set<String>>(
      name: 'telefones',
      initialValue: ref.read(editorContatoNotifierProvider).telefones,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(1),
      ]),
      builder: (field) => InputDecorator(
        decoration: InputDecoration(
          errorText: field.errorText,
          contentPadding: const EdgeInsets.all(0),
          fillColor: Colors.transparent,
        ),
        child: FormSection(
          title: 'Telefone(s)',
          child: Consumer(
            builder: (context, ref, _) {
              ref.listen(
                  editorContatoNotifierProvider
                      .select((value) => value.telefones), (_, next) {
                field.didChange(next);
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
                                EditorTelefoneDialog(
                                  telefone: telefone,
                                  onSave: (value) => ref
                                      .read(editorContatoNotifierProvider
                                          .notifier)
                                      .alterarTelefone(
                                        currentValue: telefone,
                                        newValue: value,
                                      ),
                                ),
                                useProviderScope: false,
                              )
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
                    CustomChip.add(() => context.openModal(
                        EditorTelefoneDialog(
                            onSave: ref
                                .read(editorContatoNotifierProvider.notifier)
                                .adicionarTelefone),
                        useProviderScope: false)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
