import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/is_loading_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/widgets/criar_account_fields.dart';

class CriarAccountSection extends ConsumerStatefulWidget {
  const CriarAccountSection({super.key});

  @override
  ConsumerState<CriarAccountSection> createState() =>
      _CriarAccountSectionState();
}

class _CriarAccountSectionState extends ConsumerState<CriarAccountSection> {
  bool? _checkboxValue = false;

  void onCheckboxChanged(bool? value) {
    if (ref.watch(isLoadingControllerProvider)) return;

    setState(() {
      _checkboxValue = value;
    });

    if (_checkboxValue == false) {
      ref.read(editorContatoNotifierProvider.notifier).removerAccount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: Text(
            'Criar conta de usuário',
            style: context.theme.textTheme.titleLarge,
          ),
          value: _checkboxValue,
          onChanged: onCheckboxChanged,
        ),
        if (_checkboxValue != false) ...[
          const CriarAccountFields(),
        ]
      ],
    );
  }
}
