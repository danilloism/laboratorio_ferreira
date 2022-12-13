import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/validator.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';

class CriarAccountFields extends ConsumerWidget {
  const CriarAccountFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormSection(
                titleStyle: context.theme.textTheme.titleMedium,
                title: 'Email',
                child: FormBuilderTextField(
                  name: 'email',
                  onChanged: (value) => ref
                      .read(editorContatoNotifierProvider.notifier)
                      .emailTeveAlteracao(value ?? ''),
                  initialValue:
                      ref.read(editorContatoNotifierProvider).account?.email,
                  validator: Validator.email(),
                ),
              ),
              const SizedBox(height: 10),
              FormSection(
                titleStyle: context.theme.textTheme.titleMedium,
                title: 'Senha',
                child: FormBuilderTextField(
                  obscureText: true,
                  name: 'senha',
                  onChanged: (value) => ref
                      .read(editorContatoNotifierProvider.notifier)
                      .senhaTeveAlteracao(value ?? ''),
                  initialValue:
                      ref.read(editorContatoNotifierProvider).account?.senha,
                  validator: Validator.senha(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
