import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/controllers/editor_contato_controller.dart';
import 'package:mask/mask.dart';

class EditorTelefoneDialog extends StatelessWidget {
  EditorTelefoneDialog({
    super.key,
    this.telefone = '',
    required this.onSave,
  });

  final String telefone;

  final _key = GlobalKey<FormBuilderState>();
  final FutureOr<void> Function(String value) onSave;

  Future<void> _submit({required BuildContext context}) async {
    if (_key.currentState!.validate()) {
      final String value = _key.currentState!.fields['telefone']!.value;
      if (onSave is Future<void> Function(String)) {
        await (onSave as Future<void> Function(String))(value)
            .whenComplete(() => Navigator.pop(context));

        return;
      }

      onSave(value);
      Navigator.pop(context);
    }
  }

  bool get isEditar => telefone.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _key,
      child: AlertDialog(
        title: isEditar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Alterar telefone'),
                  Consumer(builder: (context, ref, _) {
                    return IconButton(
                      onPressed: () {
                        ref
                            .read(editorContatoNotifierProvider.notifier)
                            .removerTelefone(telefone);
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.trash),
                      color: Colors.red,
                      padding: const EdgeInsets.all(0),
                    );
                  }),
                ],
              )
            : const Center(child: Text('Adicionar telefone')),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => _submit(context: context),
            child: isEditar ? const Text('Alterar') : const Text('Adicionar'),
          ),
        ],
        content: FormBuilderTextField(
          name: 'telefone',
          autofocus: true,
          initialValue:
              telefone.isEmpty ? null : Formatter.applyPhoneMask(telefone),
          keyboardType: TextInputType.number,
          onSubmitted: (_) => _submit(context: context),
          inputFormatters: [
            Mask.generic(masks: ['(##) #####-####'])
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.equalLength(
              15,
              errorText: 'Telefone deve possuir ddd e dígito 9.',
            ),
          ]),
        ),
      ),
    );
  }
}
