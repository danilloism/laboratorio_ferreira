import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/custom_action_chip.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/helpers/editor_contato_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/bloc.dart';

class TelefonesFormSection extends StatelessWidget {
  const TelefonesFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Telefone(s)',
      child: BlocSelector<EditorContatoCubit, Contato, Set<String>>(
          selector: (state) => state.telefones,
          builder: (context, state) {
            final editorContatoCubit = EditorContatoCubit.of(context);
            final podeEditarTelefone =
                EditorContatoHelper.usuarioLogadoPodeEditarContato(
              usuarioLogado: SettingsBloc.of(context).state.session!.contato,
              contatoSendoEditado: editorContatoCubit.state,
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10,
                children: [
                  ...state.map(
                    (telefone) => CustomActionChip(
                      label: Text(Formatter.applyPhoneMask(telefone)),
                      onPressed: () => podeEditarTelefone
                          ? showDialog(
                              context: context,
                              builder: (context) => BlocProvider.value(
                                  value: editorContatoCubit,
                                  child:
                                      EditorTelefoneDialog(telefone: telefone)),
                            )
                          : null,
                    ),
                  ),
                  if (podeEditarTelefone)
                    CustomActionChip(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => BlocProvider.value(
                            value: editorContatoCubit,
                            child: const EditorTelefoneDialog()),
                      ),
                      label: const Icon(Icons.add),
                      padding: const EdgeInsets.all(6),
                    ),
                ],
              ),
            );
          }),
    );
  }
}
