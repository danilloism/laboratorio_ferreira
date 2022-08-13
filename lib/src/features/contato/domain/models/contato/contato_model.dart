import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/account/account_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/shared/enums/roles_enum.dart';

part 'contato_model.g.dart';

@JsonSerializable()
class ContatoModel {
  final String? uid;
  final String nome;
  final Set<String> _telefones = {};
  final Set<RolesEnum> _categorias = {};
  final bool? ativo;
  final AccountModel? account;
  final DateTime? criadoEm, atualizadoEm;

  ContatoModel({
    this.uid,
    required this.nome,
    required Iterable<String> telefones,
    required Iterable<RolesEnum> categorias,
    this.criadoEm,
    this.atualizadoEm,
    this.ativo,
    this.account,
  }) {
    _telefones.addAll(telefones);
    _categorias.addAll(categorias);
  }

  Set<String> get telefones => UnmodifiableSetView(_telefones);
  Set<RolesEnum> get categorias => UnmodifiableSetView(_categorias);

  void addTelefones(Iterable<String> telefones) => _telefones.addAll(telefones);
  void addCategorias(Iterable<RolesEnum> categorias) =>
      _categorias.addAll(categorias);

  bool removeTelefone(String telefone) => _telefones.remove(telefone);
  bool removeCategoria(RolesEnum categoria) => _categorias.remove(categoria);

  @override
  int get hashCode =>
      criadoEm.hashCode ^
      uid.hashCode ^
      nome.hashCode ^
      telefones.hashCode ^
      categorias.hashCode;

  @override
  bool operator ==(covariant ContatoModel other) =>
      uid == other.uid &&
      nome == other.nome &&
      const SetEquality().equals(_telefones, other.telefones) &&
      const SetEquality().equals(_categorias, other.categorias) &&
      criadoEm.toString() == other.criadoEm.toString();

  factory ContatoModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContatoModelToJson(this);
}
