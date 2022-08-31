import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/models.dart';

part '../../../../generated/src/features/auth/bloc/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn({required Session session}) = _LoggedIn;
  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.loggingIn() = _LoggingIn;
  const factory AuthState.error({
    required dynamic error,
    Account? user,
  }) = _Error;
  const factory AuthState.unknown() = _Unknown;

  const AuthState._();
}
