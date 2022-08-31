import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/models.dart';

part '../../../../generated/src/features/auth/bloc/auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appInitialized() = AppInitialized;
  const factory AuthEvent.logInButtonPressed({required Account account}) =
      LogInButtonPressed;
  const factory AuthEvent.logOutButtonPressed() = LogOutButtonPressed;
}
