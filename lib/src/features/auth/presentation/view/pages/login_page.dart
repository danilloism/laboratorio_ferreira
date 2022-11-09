import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/view/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/settings'),
        child: const Icon(Icons.settings),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(height: 150),
              const SizedBox(height: 16),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
