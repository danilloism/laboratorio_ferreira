import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/custom_text_form_field.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/form_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailTextController.text = 'danilloilggner@gmail.com';
    _passwordTextController.text = 'senhatemp123';
    super.initState();
  }

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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FormSection(
                        child: CustomTextFormField(
                          validator: (value) {
                            return EmailValidator.validate(value ?? '')
                                ? null
                                : 'Email inválido';
                          },
                          controller: _emailTextController,
                          label: 'Email',
                        ),
                      ),
                      FormSection(
                        child: CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Senha inválida';
                            }

                            return null;
                          },
                          controller: _passwordTextController,
                          obscureText: true,
                          label: 'Senha',
                        ),
                      ),
                      ref.watch(authNotifierProvider) ==
                              const AuthState.loggingIn()
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref.read(authNotifierProvider.notifier).login(
                                        Account(
                                          email: _emailTextController.text,
                                          senha: _passwordTextController.text,
                                        ),
                                      );
                                }
                              },
                              child: const Text('Login')),
                    ],
                  ),
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
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
