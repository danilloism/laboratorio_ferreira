import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/features/auth/models/token.g.dart';
part '../../../../generated/src/features/auth/models/token.freezed.dart';

@freezed
class Token with _$Token {
  const factory Token(String accessToken) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
