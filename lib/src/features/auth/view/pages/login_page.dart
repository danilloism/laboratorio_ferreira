import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/logo.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 8),
              Text('Bem vindo!', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 8),
              BlocProvider(
                create: (context) =>
                    LoginFormCubit(context.read<AuthRepository>()),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoginForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
