import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

class LoggedInSettingsButtons extends StatelessWidget {
  const LoggedInSettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final podeCriarConta = SettingsBloc.of(context)
        .state
        .session!
        .contato
        .temHierarquiaMaiorOuIgualQue(Roles.gerente);
    return Row(
      mainAxisAlignment: podeCriarConta
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (podeCriarConta)
          ElevatedButton(
            onPressed: () {},
            child: const Text('Criar nova conta'),
          ),
        ElevatedButton(
          onPressed: () {
            context.goNamed(Routes.welcome.name); //TODO: ta feio isso aqui
            AuthBloc.of(context).add(const AuthEvent.logOutButtonPressed());
          },
          child: const Text('Sair'),
        ),
      ],
    );
  }
}
