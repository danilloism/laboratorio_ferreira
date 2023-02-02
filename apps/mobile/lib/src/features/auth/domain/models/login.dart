import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/features/auth/domain/models/login.freezed.dart';
part '../../../../../generated/src/features/auth/domain/models/login.g.dart';

@Freezed(
  toJson: true,
  equal: false,
  toStringOverride: false,
  fromJson: false,
)
class Login with _$Login {
  const factory Login({
    @Default('') String email,
    @Default('') String senha,
    @JsonKey(ignore: true) @Default(false) bool submissionInProgress,
  }) = _Login;
}
