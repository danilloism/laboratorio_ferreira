import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';

class NameFormSection extends StatelessWidget {
  const NameFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Nome',
      child: CustomTextFormField(
        onChanged: EditorContatoCubit.of(context).nomeTeveAlteracao,
        initialValue: EditorContatoCubit.of(context).state.nome,
      ),
    );
  }
}
