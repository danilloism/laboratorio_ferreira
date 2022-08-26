import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/features/network/models/api_response_model.freezed.dart';
part '../../../../generated/src/features/network/models/api_response_model.g.dart';

@Freezed(toJson: false, genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool sucesso,
    T? dados,
    String? mensagem,
    dynamic erro,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
