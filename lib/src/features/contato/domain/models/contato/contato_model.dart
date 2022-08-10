import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/account/account_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/shared/models/base_model/base_model.dart';

part 'contato_model.g.dart';

@JsonSerializable()
class ContatoModel extends BaseModel {
  final String? uid;
  final String nome;
  final Set<String> _telefones = {};
  final Set<RolesEnum> _categorias = {};
  final bool? ativo;
  final AccountModel? account;

  ContatoModel({
    this.uid,
    required this.nome,
    required Iterable<String> telefones,
    required Iterable<RolesEnum> categorias,
    super.criadoEm,
    super.atualizadoEm,
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
}
