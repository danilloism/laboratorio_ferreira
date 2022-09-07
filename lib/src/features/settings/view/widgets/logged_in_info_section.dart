import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
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
              onPressed: () => context.pushNamed(
                Routes.detalhesContato.name,
                params: {'uid': 'me'},
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
