import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

class CategoriasFormSection extends StatelessWidget {
  const CategoriasFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Categorias',
      child: BlocSelector<EditorContatoCubit, Contato, Set<Roles>>(
        selector: (state) => state.categorias,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomWrap(
            children: [
              ...state.skipWhile((value) => value == Roles.admin).map(
                  (categoria) =>
                      CustomActionChip(label: Text(categoria.capitalized))),
              const CustomActionChip(
                label: Icon(Icons.add),
                padding: EdgeInsets.all(6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
