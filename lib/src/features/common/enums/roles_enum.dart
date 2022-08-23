import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../../../generated/src/features/common/enums/roles_enum.g.dart';

@HiveType(typeId: 0)
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum RolesEnum {
  @HiveField(0)
  admin,
  @HiveField(1)
  gerente,
  @HiveField(2)
  colaborador,
  @HiveField(3)
  dentista,
  @HiveField(4)
  paciente,
  @HiveField(5)
  entregador,
  @HiveField(6)
  fornecedor;

  String get capitalized => '${name[0].toUpperCase()}${name.substring(1)}';
}
