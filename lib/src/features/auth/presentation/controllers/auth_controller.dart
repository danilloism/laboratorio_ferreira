import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/auth/presentation/controllers/auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    final initialLocalSession = ref.read(settingsControllerProvider).session;

    final tokenValido = initialLocalSession != null &&
        !JwtDecoder.isExpired(initialLocalSession.accessToken);

    if (tokenValido) {
      // _authRepo.authToken = _localSession!.accessToken;
      return AuthState.loggedIn(session: initialLocalSession);
    }

    return const AuthState.loggedOut();
  }

  Future<void> login(Login login) async {
    try {
      final session = await ref.read(authRepositoryProvider).login(login);
      state = AuthState.loggedIn(session: session);
    } on RepositoryException catch (e) {
      state = AuthState.error(error: e);
    } catch (e) {
      state = AuthState.error(error: e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState.loggedOut();
  }
}

@riverpod
Contato? usuarioLogado(UsuarioLogadoRef ref) {
  return ref.watch(settingsControllerProvider).session?.contato;
}
