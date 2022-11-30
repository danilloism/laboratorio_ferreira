import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/add_categoria_dialog.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class CategoriasFormSection extends ConsumerWidget {
  const CategoriasFormSection({super.key});

  // bool _usuarioPodeEditarCategoria(Contato usuarioLogado,
  //     {required Contato contatoSendoEditado}) {
  //   return usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) &&
  //       usuarioLogado.uid != contatoSendoEditado.uid;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuario = ref.read(usuarioLogadoProvider)!;
    // final contatoSendoEditado = ref.read(editorContatoNotifierProvider);
    return FormBuilderField<Set<Roles>>(
      name: 'categorias',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      initialValue: ref.read(editorContatoNotifierProvider).categorias,
      builder: (field) => InputDecorator(
        decoration: InputDecoration(
          errorText: field.errorText,
          contentPadding: const EdgeInsets.all(0),
          fillColor: Colors.transparent,
        ),
        child: FormSection(
          title: 'Categoria(s)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, _) {
                ref.listen(
                    editorContatoNotifierProvider
                        .select((value) => value.categorias), (_, next) {
                  field.didChange(next);
                });
                final categorias = ref
                    .watch(editorContatoNotifierProvider
                        .select((value) => value.categorias))
                    .toList()
                  ..sort((a, b) => a.name.compareTo(b.name));
                return CustomWrap(
                  children: [
                    ...categorias.map((categoria) => CustomChip(
                          key: ValueKey('chip-$categoria'),
                          label: Text(categoria.capitalized),
                          confirmDeleteAction: false,
                          onDeleted: usuario.temHierarquiaMaiorOuIgualQue(
                                      Roles.gerente) &&
                                  usuario.temHierarquiaMaiorQue(categoria)
                              ? () => ref
                                  .read(editorContatoNotifierProvider.notifier)
                                  .removerCategoria(categoria)
                              : null,
                        )),
                    if (usuario.temHierarquiaMaiorOuIgualQue(Roles.gerente) &&
                        categorias.length <= 6)
                      CustomChip.add(
                        () => context.openModal(
                          AddCategoriaDialog(
                            categorias: Roles.values
                                .where((role) =>
                                    !ref
                                        .read(editorContatoNotifierProvider)
                                        .isA(role) &&
                                    ref
                                        .read(usuarioLogadoProvider)!
                                        .temHierarquiaMaiorOuIgualQue(role) &&
                                    !role.isAdmin)
                                .toSet(),
                            onSave: ref
                                .read(editorContatoNotifierProvider.notifier)
                                .adicionarCategorias,
                          ),
                          useProviderScope: false,
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
