import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/router_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    _userTextController.text = 'danilloilggner@gmail.com';
    _passwordTextController.text = 'senhatemp123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authNotifierProvider).maybeWhen(
        orElse: () {},
        error: (erro, user) {
          print(erro);
        },
        loggedIn: (session) =>
            ref.read(routerServiceProvider).router.goNamed(Routes.home.name));
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 8),
              const Text('Bem vindo!'),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: _validator,
                      controller: _userTextController,
                    ),
                    TextFormField(
                      validator: _validator,
                      controller: _passwordTextController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final authNotifier =
                                ref.read(authNotifierProvider.notifier);

                            authNotifier.login(
                              Account(
                                email: _userTextController.text,
                                senha: _passwordTextController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Login')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Dado inválido.';
    }

    return null;
  }
}
