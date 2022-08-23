import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/models/uid_with_date_log_model.dart';

part '../../../../generated/src/features/contato/models/contato_model.g.dart';

@JsonSerializable()
class ContatoModel extends UidWithDateLogModel with EquatableMixin {
  final String nome;
  final Set<String> _telefones = {};
  final Set<RolesEnum> _categorias = {};
  final bool? ativo;
  final Account? account;

  ContatoModel({
    super.uid,
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

  factory ContatoModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContatoModelToJson(this);

  @override
  List<Object?> get props => [
        uid,
        nome,
        criadoEm,
        _telefones,
        _categorias,
      ];
}
