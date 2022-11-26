import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/selected_categorias_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';

class AddCategoriaDialog extends StatelessWidget {
  AddCategoriaDialog({super.key});

  final _selectedCategoriasProvider = selectedCategoriasControllerProvider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Selecionar Categorias')),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
                onPressed: () {
                  final categoriasSelecionadas =
                      ref.read(_selectedCategoriasProvider);
                  ref
                      .read(editorContatoNotifierProvider.notifier)
                      .adicionarCategorias(categoriasSelecionadas);
                  Navigator.pop(context);
                },
                child: const Text('Adicionar'));
          },
        ),
      ],
      content: Consumer(
        builder: (context, ref, child) {
          final contato = ref.read(editorContatoNotifierProvider);
          return CustomWrap(
            children: [
              ...Roles.values
                  .where((role) =>
                      !contato.isA(role) &&
                      ref
                          .read(usuarioLogadoProvider)!
                          .temHierarquiaMaiorOuIgualQue(role) &&
                      !role.isAdmin)
                  .map(
                    (role) => CustomChip(
                      label: Text(role.capitalized),
                      selected:
                          ref.watch(_selectedCategoriasProvider).contains(role),
                      onSelected: (selected) {
                        final selectedCategoriesNotifier =
                            ref.read(_selectedCategoriasProvider.notifier);

                        if (selected) {
                          selectedCategoriesNotifier.add(role);
                          return;
                        }

                        selectedCategoriesNotifier.remove(role);
                      },
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
