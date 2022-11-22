// coverage:ignore-file
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Roles {
  admin,
  gerente,
  colaborador,
  dentista,
  paciente,
  entregador,
  fornecedor;

  String get capitalized => '${name[0].toUpperCase()}${name.substring(1)}';
}
