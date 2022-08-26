import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/login_form_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/login_form.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/custom_text_form_field.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/form_section.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginFormCubit, LoginForm>(
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
        BlocBuilder<LoginFormCubit, LoginForm>(
          buildWhen: (anterior, novo) => anterior.senha != novo.senha,
          builder: (context, state) {
            return FormSection(
              child: CustomTextFormField(
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Senha inválida';
                //   }
                //
                //   return null;
                // },
                // controller: _passwordTextController,
                obscureText: true,
                label: 'Senha',
                onChanged: (senha) =>
                    context.read<LoginFormCubit>().senhaTeveAlteracao(senha),
              ),
            );
          },
        ),
      ],
    );
  }
}
