import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/data.dart';

class LoginFormCubit extends Cubit<Login> {
  final AuthRepository _authRepo;
  LoginFormCubit(AuthRepository authRepository)
      : _authRepo = authRepository,
        super(const Login());

  void emailTeveAlteracao(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(
        email: email, status: Formz.validate([email, state.senha!])));
  }

  void senhaTeveAlteracao(String value) {
    final senha = SenhaInput.dirty(value);
    emit(state.copyWith(
        senha: senha, status: Formz.validate([state.email!, senha])));
  }
}
