import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/common.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/lista_contatos/view/widgets/criar_contato_button.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/bloc.dart';

class ContatosPageView extends StatelessWidget {
  const ContatosPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioLogado = SettingsBloc.of(context).state.session!.contato;
    final podeCriarContato =
        usuarioLogado.temHierarquiaMaiorOuIgualQue(Roles.gerente) ||
            usuarioLogado.isDentistaEspacoOdontologico;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: podeCriarContato
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (podeCriarContato) const CriarContatoButton(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.filter_list_rounded),
                      SizedBox(width: 8),
                      Text('Filtrar'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
