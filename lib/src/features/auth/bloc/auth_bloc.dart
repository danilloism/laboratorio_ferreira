// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;
  final SettingsRepository _settingsRepo;

  AuthBloc(
      {required AuthRepository authRepository,
      required SettingsRepository settingsRepository})
      : _authRepo = authRepository,
        _settingsRepo = settingsRepository,
        super(const AuthState.unknown()) {
    on<AppInitialized>((event, emit) async {
      var session = _settingsRepo.activeStored.session;

      final tokenValido =
          session != null && !JwtDecoder.isExpired(session.accessToken);

      if (tokenValido) {
        _authRepo.authToken = session.accessToken;
        return emit(AuthState.loggedIn(session: session));
      }
      emit(const AuthState.loggedOut());
    });

    on<LogInButtonPressed>((event, emit) async {
      emit(const AuthState.loggingIn());

      try {
        final session = await _authRepo.login(event.account);
        await _settingsRepo.upsertSetting(Setting(session: session));
        emit(AuthState.loggedIn(session: session));
      } on RepositoryException catch (e) {
        emit(AuthState.error(error: e.message));
      } catch (e) {
        emit(AuthState.error(error: e.toString()));
      }
    });

    on<LogOutButtonPressed>((event, emit) async {
      _authRepo.authToken = null;
      await _settingsRepo.upsertSetting(const Setting());
      emit(const AuthState.loggedOut());
    });
  }
}
