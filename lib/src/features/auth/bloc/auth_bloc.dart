// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthBloc({required AuthRepository authRepository, Session? localSession})
      : _authRepo = authRepository,
        super(const AuthState.unknown()) {
    on<AppInitialized>((event, emit) async {
      final tokenValido = localSession != null &&
          !JwtDecoder.isExpired(localSession.accessToken);

      if (tokenValido) {
        _authRepo.authToken = localSession.accessToken;
        return emit(AuthState.loggedIn(session: localSession));
      }
      emit(const AuthState.loggedOut());
    });

    on<LogInButtonPressed>((event, emit) async {
      try {
        final session = await _authRepo.login(event.account);
        emit(AuthState.loggedIn(session: session));
      } on RepositoryException catch (e) {
        emit(AuthState.error(error: e));
      } catch (e) {
        emit(AuthState.error(error: e.toString()));
      }
    });

    on<LogOutButtonPressed>((event, emit) async {
      _authRepo.authToken = null;
      emit(const AuthState.loggedOut());
    });
  }

  static AuthBloc of(BuildContext context) => context.read<AuthBloc>();
}
