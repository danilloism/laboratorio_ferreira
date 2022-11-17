import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/contato_notifier.dart';

class CategoriasFormSection extends ConsumerWidget {
  const CategoriasFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorias = ref.watch(
        editorContatoNotifierProvider.select((value) => value.categorias));
    return FormSection(
      title: 'Categorias',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomWrap(
          children: [
            ...categorias.skipWhile((value) => value == Roles.admin).map(
                (categoria) =>
                    CustomActionChip(label: Text(categoria.capitalized))),
            const CustomActionChip(
              label: Icon(Icons.add),
              padding: EdgeInsets.all(6),
            ),
          ],
        ),
      ),
    );
  }
}
