import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

part '../../../../generated/src/features/auth/models/auth_response.freezed.dart';
part '../../../../generated/src/features/auth/models/auth_response.g.dart';

@Freezed(toJson: false)
class AuthResponse with _$AuthResponse {
  const factory AuthResponse(String accessToken, Contato contato) =
      _AuthResponse;

  factory AuthResponse.fromJson(Object? json) =>
      _$AuthResponseFromJson(json as Map<String, dynamic>);
}
