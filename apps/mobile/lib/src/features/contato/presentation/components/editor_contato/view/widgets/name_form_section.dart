import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';

class NameFormSection extends ConsumerWidget {
  const NameFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormSection(
      title: 'Nome',
      child: FormBuilderTextField(
        name: 'nome',
        onChanged: (value) => ref
            .read(editorContatoNotifierProvider.notifier)
            .nomeTeveAlteracao(value ?? ''),
        initialValue: ref.read(editorContatoNotifierProvider).nome,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(80),
          FormBuilderValidators.minLength(4),
        ]),
      ),
    );
  }
}
