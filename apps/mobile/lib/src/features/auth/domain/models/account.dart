import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/features/auth/domain/models/account.freezed.dart';
part '../../../../../generated/src/features/auth/domain/models/account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required String email,
    String? senha,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
