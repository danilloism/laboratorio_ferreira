import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/data.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/enums/enums.dart';

class LoginFormCubit extends Cubit<Login> {
  LoginFormCubit()
      : super(Login(
          error: _formatError(
            emailErr: '${EmailInputError.empty}',
            senhaErr: '${SenhaInputError.empty}',
          ),
        ));

  void emailTeveAlteracao(String value) {
    final email = EmailInput.dirty(value);
    final status = _validate([email, state.senha]);

    if (status.isValid) {
      emit(state.copyWith(email: email, status: status));
      return;
    }

    emit(state.copyWith(
        email: email,
        error: _formatError(
          emailErr: email.error?.toString(),
          senhaErr: state.senha.error?.toString(),
        ),
        status: status));
  }

  void senhaTeveAlteracao(String value) {
    final senha = SenhaInput.dirty(value);
    final status = _validate([state.email, senha]);

    if (status.isValid) {
      emit(state.copyWith(senha: senha, status: status));
      return;
    }

    emit(state.copyWith(
        senha: senha,
        error: _formatError(
          emailErr: state.email.error?.toString(),
          senhaErr: senha.error?.toString(),
        ),
        status: status));
  }

  void submit() {
    final submitted = state.copyWith();
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    if (!submitted.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }

  FormzStatus _validate(List<FormzInput<dynamic, dynamic>> inputs) =>
      Formz.validate(inputs);

  static LoginFormCubit of(BuildContext context) =>
      context.read<LoginFormCubit>();
}

String? _formatError({String? emailErr, String? senhaErr}) {
  final formatted = '${emailErr ?? ''}\n${senhaErr ?? ''}'.trim();

  return formatted.isEmpty ? null : formatted;
}
