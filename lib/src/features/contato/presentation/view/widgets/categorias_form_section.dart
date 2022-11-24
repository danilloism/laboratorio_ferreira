import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/editor_contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/widgets/add_categoria_dialog.dart';
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
    final categorias = ref
        .watch(
            editorContatoNotifierProvider.select((value) => value.categorias))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    final usuario = ref.read(usuarioLogadoProvider)!;
    // final contatoSendoEditado = ref.read(editorContatoNotifierProvider);
    return FormSection(
      title: 'Categorias',
      child: CustomWrap(
        children: [
          ...categorias.map((categoria) => CustomChip(
                key: ValueKey('chip-$categoria'),
                label: Text(categoria.capitalized),
                confirmDeleteAction: false,
                onDeleted:
                    usuario.temHierarquiaMaiorOuIgualQue(Roles.gerente) &&
                            usuario.temHierarquiaMaiorQue(categoria)
                        ? () => ref
                            .read(editorContatoNotifierProvider.notifier)
                            .removerCategoria(categoria)
                        : null,
              )),
          if (usuario.temHierarquiaMaiorOuIgualQue(Roles.gerente) &&
              categorias.length <= 6)
            CustomChip(
              label: const Icon(Icons.add),
              onPressed: () => context.openModal(AddCategoriaDialog()),
            ),
        ],
      ),
    );
  }
}
