import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  final DateTime? criadoEm, atualizadoEm;

  BaseModel({this.criadoEm, this.atualizadoEm});
}
