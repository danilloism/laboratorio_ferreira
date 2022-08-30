import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/auth_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/auth_event.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/login_form_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/login.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/custom_text_form_field.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/form_section.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  bool _isButtonValid(BuildContext context) {
    final formState = context.watch<LoginFormCubit>().state;
    if (formState.status != FormzStatus.valid) return false;
    return context
        .watch<AuthBloc>()
        .state
        .maybeWhen(loggingIn: () => false, orElse: () => true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginFormCubit, Login>(
          buildWhen: (anterior, novo) => anterior.email != novo.email,
          builder: (context, state) {
            return FormSection(
              child: CustomTextFormField(
                // validator: (value) {
                //   return EmailValidator.validate(value ?? '')
                //       ? null
                //       : 'Email inválido';
                // },
                // controller: _emailTextController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) =>
                    context.read<LoginFormCubit>().emailTeveAlteracao(email),
              ),
            );
          },
        ),
        BlocBuilder<LoginFormCubit, Login>(
          buildWhen: (anterior, novo) => anterior.senha != novo.senha,
          builder: (context, state) {
            return FormSection(
              child: CustomTextFormField(
                obscureText: true,
                label: 'Senha',
                onChanged: (senha) =>
                    context.read<LoginFormCubit>().senhaTeveAlteracao(senha),
              ),
            );
          },
        ),
        ElevatedButton(
            onPressed: _isButtonValid(context)
                ? () => context.read<AuthBloc>().add(
                    AuthEvent.logInButtonPressed(
                        account: Account(
                            email: context
                                .read<LoginFormCubit>()
                                .state
                                .email!
                                .value,
                            senha: context
                                .read<LoginFormCubit>()
                                .state
                                .senha!
                                .value)))
                : null,
            child: const Text('Login')),
      ],
    );
  }
}
