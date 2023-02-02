import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/domain/models/api_response.freezed.dart';
part '../../../../generated/src/core/domain/models/api_response.g.dart';

@Freezed(
  toJson: false,
  genericArgumentFactories: true,
  copyWith: false,
  equal: false,
  toStringOverride: false,
)
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
