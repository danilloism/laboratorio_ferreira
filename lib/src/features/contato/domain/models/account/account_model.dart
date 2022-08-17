import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/models/date_log_model.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel extends DateLogModel with EquatableMixin {
  final String email, senha;
  final String? username;

  const AccountModel({
    required this.email,
    this.username,
    required this.senha,
    super.criadoEm,
    super.atualizadoEm,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  @override
  List<Object?> get props => [email, criadoEm];
}
