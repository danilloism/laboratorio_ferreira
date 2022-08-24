import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/models/uid_with_date_log_model.dart';

part '../../../../generated/src/features/contato/models/contato.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Contato extends UidWithDateLogModel with EquatableMixin {
  @HiveField(0)
  final String nome;
  @HiveField(1)
  final List<String> telefones;
  @HiveField(2)
  final List<RolesEnum> categorias;
  @HiveField(3)
  final bool? ativo;
  @HiveField(4)
  final Account? account;

  Contato({
    super.uid,
    required this.nome,
    required this.telefones,
    required this.categorias,
    super.criadoEm,
    super.atualizadoEm,
    this.ativo,
    this.account,
  });

  factory Contato.fromJson(Object? json) =>
      _$ContatoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ContatoToJson(this);

  @override
  List<Object?> get props => [
        uid,
        nome,
        criadoEm,
        telefones,
        categorias,
      ];
}
