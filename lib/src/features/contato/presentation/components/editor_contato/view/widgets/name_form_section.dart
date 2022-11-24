import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_notifier.dart';

class NameFormSection extends ConsumerWidget {
  const NameFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormSection(
      title: 'Nome',
      child: CustomTextFormField(
        onChanged:
            ref.read(editorContatoNotifierProvider.notifier).nomeTeveAlteracao,
        initialValue: ref.read(editorContatoNotifierProvider).nome,
      ),
    );
  }
}
