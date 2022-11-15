import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/data.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepo;
  final Session? _localSession;
  AuthNotifier({
    required AuthRepository authRepository,
    Session? localSession,
  })  : _authRepo = authRepository,
        _localSession = localSession,
        super(const AuthState.unknown()) {
    final tokenValido = _localSession != null &&
        !JwtDecoder.isExpired(_localSession!.accessToken);

    if (tokenValido) {
      // _authRepo.authToken = _localSession!.accessToken;
      state = AuthState.loggedIn(session: _localSession!);
      return;
    }

    state = const AuthState.loggedOut();
  }

  Future<void> login(Account account) async {
    try {
      final session = await _authRepo.login(account);
      state = AuthState.loggedIn(session: session);
    } on RepositoryException catch (e) {
      state = AuthState.error(error: e);
    } catch (e) {
      state = AuthState.error(error: e.toString());
    }
  }

  void logout() {
    // _authRepo.authToken = null;
    state = const AuthState.loggedOut();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(
        authRepository: ref.watch(authRepositoryProvider),
        localSession:
            ref.watch(settingsRepositoryProvider).activeStored.session));
