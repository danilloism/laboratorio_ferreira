import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/auth/presentation/controllers/login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Login build() {
    return const Login();
  }

  void emailTeveAlteracao(String value) {
    state = state.copyWith(email: value);
  }

  void senhaTeveAlteracao(String value) {
    state = state.copyWith(senha: value);
  }

  void submit() {
    state = state.copyWith(submissionInProgress: true);

    ref
        .read(authControllerProvider.notifier)
        .login(state)
        .catchError((e) => reset());
  }

  void reset() {
    state = const Login();
  }
}
