import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.settings.name),
        child: const Icon(Icons.settings),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Logo(height: 150),
              SizedBox(height: 16),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
