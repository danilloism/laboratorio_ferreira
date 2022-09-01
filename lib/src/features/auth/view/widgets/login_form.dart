import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          BlocBuilder<LoginFormCubit, Login>(
            buildWhen: (anterior, novo) => anterior.email != novo.email,
            builder: (context, state) {
              return FormSection(
                child: CustomTextFormField(
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: LoginFormCubit.of(context).emailTeveAlteracao,
                  inputAction: TextInputAction.next,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<LoginFormCubit, Login>(
            buildWhen: (anterior, novo) => anterior.senha != novo.senha,
            builder: (context, state) {
              return FormSection(
                child: CustomTextFormField(
                  obscureText: true,
                  label: 'Senha',
                  onChanged: LoginFormCubit.of(context).senhaTeveAlteracao,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<LoginFormCubit, Login>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress ||
                  state.status.isSubmissionSuccess) {
                return const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircularProgressIndicator(),
                );
              }

              return ElevatedButton(
                onPressed: () {
                  if (!state.status.isValid) {
                    context.showErrorSnackBar(message: state.error!);
                    return;
                  }

                  LoginFormCubit.of(context).submit();
                  AuthBloc.of(context).add(
                    AuthEvent.logInButtonPressed(
                      account: Account(
                          email: state.email.value, senha: state.senha.value),
                    ),
                  );
                },
                child: const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }
}
