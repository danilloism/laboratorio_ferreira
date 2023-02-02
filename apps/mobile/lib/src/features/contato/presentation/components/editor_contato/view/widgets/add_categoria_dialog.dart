import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/roles.dart';

class AddCategoriaDialog extends StatelessWidget {
  AddCategoriaDialog({
    super.key,
    required this.onSave,
    required this.categorias,
  });
  final FutureOr<void> Function(Set<Roles>) onSave;
  final Set<Roles> categorias;

  final _key = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _key,
      child: AlertDialog(
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
                    if (_key.currentState!.validate()) {
                      final categoriasSelecionadas = _key.currentState
                          ?.fields['selected_categorias']?.value as List<Roles>;
                      onSave(categoriasSelecionadas.toSet());
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Adicionar'));
            },
          ),
        ],
        content: FormBuilderFilterChip(
          decoration: InputDecoration(
            errorText:
                _key.currentState?.fields['selected_categorias']?.errorText,
            contentPadding: const EdgeInsets.all(0),
            fillColor: Colors.transparent,
          ),
          spacing: 8,
          name: 'selected_categorias',
          initialValue: const <Roles>[],
          validator: (value) => value?.isEmpty ?? true
              ? 'Ao menos uma categoria deve ser selecionada.'
              : null,
          options: categorias
              .map(
                (categoria) => FormBuilderChipOption<Roles>(
                  value: categoria,
                  child: Text(
                    categoria.capitalized,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
