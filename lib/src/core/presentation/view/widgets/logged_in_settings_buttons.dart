import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoggedInSettingsButtons extends StatelessWidget {
  const LoggedInSettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Criar nova conta'),
        ),
        ElevatedButton(
          onPressed: () =>
              AuthBloc.of(context).add(const AuthEvent.logOutButtonPressed()),
          child: const Text('Sair'),
        ),
      ],
    );
  }
}
