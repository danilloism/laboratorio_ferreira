import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part '../../../../generated/src/features/auth/models/account.freezed.dart';
part '../../../../generated/src/features/auth/models/account.g.dart';

@freezed
class Account with _$Account {
  @HiveType(typeId: 1)
  const factory Account({
    @HiveField(0) required String email,
    @HiveField(1) String? senha,
    @HiveField(2) DateTime? criadoEm,
    @HiveField(3) DateTime? atualizadoEm,
    @HiveField(4) String? contatoUid,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
