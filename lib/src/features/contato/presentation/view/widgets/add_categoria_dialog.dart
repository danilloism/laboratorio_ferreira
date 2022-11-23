import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/editor_contato_notifier.dart';

class AddCategoriaDialog extends StatelessWidget {
  AddCategoriaDialog({super.key});

  final _selectedCategoriasProvider =
      StateProvider.autoDispose<Set<Roles>>((ref) => {});

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
            children: Roles.values
                .where((role) => !contato.isA(role))
                .map((role) => CustomChip(
                      label: Text(role.capitalized),
                      selected:
                          ref.watch(_selectedCategoriasProvider).contains(role),
                      onSelected: (selected) {
                        final notifier =
                            ref.read(_selectedCategoriasProvider.notifier);

                        if (selected) {
                          notifier.state = {...notifier.state, role};
                          return;
                        }

                        notifier.state = {...notifier.state..remove(role)};
                      },
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
