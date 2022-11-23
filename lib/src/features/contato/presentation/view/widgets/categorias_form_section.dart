import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/widgets/add_categoria_dialog.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class CategoriasFormSection extends ConsumerWidget {
  const CategoriasFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorias = ref.watch(
        editorContatoNotifierProvider.select((value) => value.categorias));
    return FormSection(
      title: 'Categorias',
      child: CustomWrap(
        children: [
          ...categorias.skipWhile((value) => value == Roles.admin).map(
              (categoria) =>
                  CustomActionChip(label: Text(categoria.capitalized))),
          if (ref
              .read(settingsNotifierProvider)
              .session!
              .contato
              .temHierarquiaMaiorOuIgualQue(Roles.gerente))
            CustomActionChip(
              label: const Icon(Icons.add),
              onPressed: () {
                final ctxContainer = ProviderScope.containerOf(context);
                showDialog(
                  context: context,
                  builder: (context) => ProviderScope(
                    parent: ctxContainer,
                    child: const AddCategoriaDialog(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
