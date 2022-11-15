import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/formatter.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/misc/helpers/editor_contato_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/controllers/contato_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/widgets/editor_telefone_dialog.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

class TelefonesFormSection extends ConsumerWidget {
  const TelefonesFormSection({super.key});

  bool _podeEditarTelefone(WidgetRef ref) {
    final editorContato = ref.read(editorContatoNotifierProvider);
    final usuarioLogado = ref.read(settingsNotifierProvider).session!.contato;

    return EditorContatoHelper.usuarioLogadoPodeEditarContato(
        usuarioLogado: usuarioLogado, contatoSendoEditado: editorContato);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctxContainer = ProviderScope.containerOf(context);
    final telefonesState = ref.watch(
        editorContatoNotifierProvider.select((value) => value.telefones));
    final podeEditarTelefone = _podeEditarTelefone(ref);
    return FormSection(
      title: 'Telefone(s)',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          children: [
            ...telefonesState.map(
              (telefone) => CustomActionChip(
                label: Text(Formatter.applyPhoneMask(telefone)),
                onPressed: () {
                  podeEditarTelefone
                      ? showDialog(
                          context: context,
                          builder: (context) => ProviderScope(
                            parent: ctxContainer,
                            child: EditorTelefoneDialog(telefone: telefone),
                          ),
                        )
                      : null;
                },
              ),
            ),
            if (podeEditarTelefone)
              CustomActionChip(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ProviderScope(
                      parent: ctxContainer,
                      child: EditorTelefoneDialog(),
                    ),
                  );
                },
                label: const Icon(Icons.add),
                padding: const EdgeInsets.all(6),
              ),
          ],
        ),
      ),
    );
  }
}
