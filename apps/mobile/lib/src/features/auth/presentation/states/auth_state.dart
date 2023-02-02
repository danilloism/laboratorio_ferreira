import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';

part '../../../../../generated/src/features/auth/presentation/states/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn({required Session session}) = LoggedIn;

  const factory AuthState.loggedOut() = LoggedOut;

  const factory AuthState.error(
      {required Object error, StackTrace? stackTrace}) = AuthError;

  const factory AuthState.unknown() = Unknown;

  const AuthState._();
}
