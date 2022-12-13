import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/helpers/helpers.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/widgets.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';

class LoginForm extends HookConsumerWidget {
  LoginForm({super.key});

  final _key = GlobalKey<FormBuilderState>();

  void _submitForm(WidgetRef ref) {
    if (_key.currentState!.saveAndValidate()) {
      ref.read(loginControllerProvider.notifier).submit();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final senhaController = useTextEditingController();

    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      next.whenOrNull(error: (error, _) {
        final notifier = ref.read(loginControllerProvider.notifier);
        String errorStr;
        if (error is RepositoryException) {
          errorStr = error.object?['data']['erro'] ?? error.message;
        } else {
          errorStr = error.toString();
        }
        context.showErrorSnackBar(message: errorStr);
        _key.currentState!.reset();
        notifier.reset();
      });
    });
    return FormBuilder(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            FormSection(
              child: FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                controller: emailController,
                validator: Validator.email(),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => ref
                    .read(loginControllerProvider.notifier)
                    .emailTeveAlteracao(value ?? ''),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 16),
            FormSection(
              child: FormBuilderTextField(
                name: 'password',
                textInputAction: TextInputAction.go,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                controller: senhaController,
                onChanged: (value) => ref
                    .read(loginControllerProvider.notifier)
                    .senhaTeveAlteracao(value ?? ''),
                onSubmitted: (_) => _submitForm(ref),
                validator: Validator.senha(),
              ),
            ),
            const SizedBox(height: 24),
            Consumer(
              builder: (context, ref, child) {
                if (ref.watch(loginControllerProvider
                    .select((value) => value.submissionInProgress))) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    UiHelper.closeKeyboard();
                    _submitForm(ref);
                  },
                  child: const Text('Entrar'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
