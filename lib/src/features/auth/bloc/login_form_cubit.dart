import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/exceptions/repository_exception.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/email_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/login_form.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/senha_input.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/api_auth_repository.dart';

class LoginFormCubit extends Cubit<LoginForm> {
  final ApiAuthRepository _authRepo;
  LoginFormCubit(ApiAuthRepository authRepository)
      : _authRepo = authRepository,
        super(const LoginForm());

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

  Future<void> logIn() async {
    if (!state.status!.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final session = await _authRepo
          .login(Account(email: state.email!.value, senha: state.senha!.value));

      emit(state.copyWith(
          session: session, status: FormzStatus.submissionSuccess));
    } on RepositoryException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, erro: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, erro: e.toString()));
    }
  }
}
