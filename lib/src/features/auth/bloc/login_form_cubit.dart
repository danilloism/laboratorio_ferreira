import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/data.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/enums/enums.dart';

class LoginFormCubit extends Cubit<Login> {
  LoginFormCubit()
      : super(
          Login(
            error:
                '${EmailInputError.empty.name}\n${SenhaInputError.empty.name}',
          ),
        );

  void emailTeveAlteracao(String value) {
    final email = EmailInput.dirty(value);
    final status = _validate([email, state.senha]);
    var erro = state.error;
    if (status.isValid) {
      erro = null;
      emit(state.copyWith(email: email, error: erro, status: status));
      return;
    }

    final emailErr = email.error?.name;
    final senhaErr = state.senha.error?.name;
    erro = '${emailErr == null ? '' : '$emailErr\n'}${senhaErr ?? ''}'.trim();
    emit(state.copyWith(email: email, error: erro, status: status));
  }

  void senhaTeveAlteracao(String value) {
    final senha = SenhaInput.dirty(value);
    final status = _validate([state.email, senha]);
    var erro = state.error;
    if (status.isValid) {
      erro = null;
      emit(state.copyWith(senha: senha, error: erro, status: status));
      return;
    }

    final emailErr = state.email.error?.name;
    final senhaErr = senha.error?.name;
    erro = '${emailErr == null ? '' : '$emailErr\n'}${senhaErr ?? ''}'.trim();
    emit(state.copyWith(senha: senha, error: erro, status: status));
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

  static LoginFormCubit watcherOf(BuildContext context) =>
      context.watch<LoginFormCubit>();
}
