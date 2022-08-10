import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/shared/models/base_model/base_model.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel extends BaseModel {
  final String email, senha;
  final String? username, contatoUid;

  AccountModel({
    this.contatoUid,
    required this.email,
    this.username,
    required this.senha,
    super.criadoEm,
    super.atualizadoEm,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
