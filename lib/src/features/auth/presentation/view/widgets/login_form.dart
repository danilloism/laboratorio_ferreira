import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({super.key});

  final loginFormProvider = StateNotifierProvider<LoginFormNotifier, Login>(
      (ref) => LoginFormNotifier());

  void _submitForm({required BuildContext context, required WidgetRef ref}) {
    final state = ref.read(loginFormProvider);

    if (!state.status.isValid) {
      context.showErrorSnackBar(message: state.errors!);
      return;
    }

    ref.read(loginFormProvider.notifier).submit();
    ref
        .read(authNotifierProvider.notifier)
        .login(Account(email: state.email.value, senha: state.senha.value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.whenOrNull(error: (error, __) {
        final notifier = ref.read(loginFormProvider.notifier);
        if (error is RepositoryException) {
          notifier.emitSubmissionFailure(
              error.object?['data']['erro'] ?? error.message);
          return;
        }

        notifier.emitSubmissionFailure(error.toString());
      });
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          FormSection(
            child: CustomTextFormField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged:
                  ref.read(loginFormProvider.notifier).emailTeveAlteracao,
              inputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          FormSection(
            child: CustomTextFormField(
              inputAction: TextInputAction.go,
              obscureText: true,
              label: 'Senha',
              onChanged:
                  ref.read(loginFormProvider.notifier).senhaTeveAlteracao,
              onFieldSubmitted: (_) => _submitForm(
                context: context,
                ref: ref,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Consumer(
            builder: (context, ref, child) {
              final status =
                  ref.watch(loginFormProvider.select((value) => value.status));
              if (status.isSubmissionInProgress) {
                return const CircularProgressIndicator();
              }

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  UiHelper.closeKeyboard();
                  _submitForm(
                    context: context,
                    ref: ref,
                  );
                },
                child: const Text('Entrar'),
              );
            },
          ),
        ],
      ),
    );
  }
}
