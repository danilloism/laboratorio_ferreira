import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/detalhes_contato/view/detalhes_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/settings_bloc.dart';

class LoggedInInfoSection extends StatelessWidget {
  const LoggedInInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final contato = SettingsBloc.of(context).state.session!.contato;

    return Column(
      children: [
        Text(
          'Olá, ${contato.nome.split(' ')[0]}',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headline5,
        ),
        const Divider(thickness: 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesContatoPage(contato),
                ),
              ),
              child: Text(
                'Ver meu contato',
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Editar conta',
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
