import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/misc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';

class LoginFormNotifier extends StateNotifier<Login> {
  LoginFormNotifier()
      : super(Login(
          errors: Formatter.fromErrorList([
            EmailInputError.empty.name,
            SenhaInputError.empty.name,
          ]),
        ));

  void emailTeveAlteracao(String value) {
    final email = EmailInput.dirty(value);
    final status = _validate([email, state.senha]);
    final errors =
        Formatter.fromErrorList([email.error?.name, state.senha.error?.name]);

    state = state.copyWith(email: email, errors: errors, status: status);
  }

  void senhaTeveAlteracao(String value) {
    final senha = SenhaInput.dirty(value);
    final status = _validate([state.email, senha]);
    final errors = Formatter.fromErrorList([
      state.email.error?.name,
      senha.error?.name,
    ]);

    state = state.copyWith(senha: senha, errors: errors, status: status);
  }

  void submit() {
    final submitted = state.copyWith();
    state = state.copyWith(status: FormzStatus.submissionInProgress);

    if (!submitted.status.isValid) {
      state = state.copyWith(status: FormzStatus.submissionFailure);
      return;
    }
  }

  void emitSubmissionFailure(String? error) {
    state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errors: Formatter.fromErrorList([state.errors, error]));
  }

  FormzStatus _validate(List<FormzInput<dynamic, dynamic>> inputs) =>
      Formz.validate(inputs);
}
