import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String email, senha;
  final String? username, contatoUid;
  final DateTime? criadoEm, atualizadoEm;

  AccountModel({
    this.contatoUid,
    required this.email,
    this.username,
    required this.senha,
    this.criadoEm,
    this.atualizadoEm,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  @override
  // TODO: implement hashCode
  int get hashCode => email.hashCode;

  @override
  bool operator ==(covariant AccountModel other) => email == other.email;
}
