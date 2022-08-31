import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/models.dart';

part '../../../../generated/src/features/auth/bloc/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn({required Session session}) = LoggedIn;

  const factory AuthState.loggedOut() = LoggedOut;

  const factory AuthState.loggingIn() = LoggingIn;

  const factory AuthState.error({
    required dynamic error,
    Account? user,
  }) = _Error;

  const factory AuthState.unknown() = Unknown;

  const AuthState._();
}
