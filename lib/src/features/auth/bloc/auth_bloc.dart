// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/exceptions/repository_exception.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/auth_event.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/bloc/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/api_auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/stored_session_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiAuthRepository _authRepo;
  final StoredSessionRepository _storedSessionRepo;

  AuthBloc({
    required ApiAuthRepository authRepository,
    required StoredSessionRepository storedSessionRepository,
  })  : _authRepo = authRepository,
        _storedSessionRepo = storedSessionRepository,
        super(const AuthState.unknown()) {
    on<AuthEvent>(
      (event, emit) {
        event.when(
          logOutButtonPressed: () {
            _storedSessionRepo.reset();
            _authRepo.resetHttpClientToken();
            emit(const AuthState.loggedOut());
            return;
          },
          appInitialized: () {
            final session = _storedSessionRepo.state;
            final tokenValido =
                session != null && !JwtDecoder.isExpired(session.accessToken);

            if (tokenValido) {
              _authRepo.resetHttpClientToken(session.accessToken);
              return emit(AuthState.loggedIn(session: session));
            }
            emit(const AuthState.loggedOut());
          },
          logInButtonPressed: (Account account) async {
            emit(const AuthState.loggingIn());

            try {
              final session = await _authRepo.login(account);
              _storedSessionRepo.reset(session);
              emit(AuthState.loggedIn(session: session));
            } on RepositoryException catch (e) {
              emit(AuthState.error(error: e.message));
            } catch (e) {
              emit(AuthState.error(error: e.toString()));
            }
          },
        );
      },
    );
  }
}
