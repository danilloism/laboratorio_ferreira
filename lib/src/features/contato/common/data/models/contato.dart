import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

part '../../../../../../generated/src/features/contato/common/data/models/contato.freezed.dart';
part '../../../../../../generated/src/features/contato/common/data/models/contato.g.dart';

@freezed
class Contato with _$Contato {
  const factory Contato({
    required String nome,
    required Set<String> telefones,
    required Set<Roles> categorias,
    required String uid,
    bool? ativo,
    Account? account,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) = _Contato;

  factory Contato.fromJson(Object? json) =>
      _$ContatoFromJson(json as Map<String, dynamic>);

  static List<Contato> fromJsonList(Object? json) {
    final payload = json as Map<String, dynamic>;
    assert(payload['dados'] is List);

    final listaDadosCrus = payload['dados'] as List;

    return listaDadosCrus.map(Contato.fromJson).toList();
  }

  static Contato get empty =>
      const Contato(nome: '', telefones: {}, categorias: {}, uid: '');
}

extension Methods on Contato {
  bool get isEmpty => this == Contato.empty;

  int get hierarquia => categorias
      .map((categoria) => categoria.index)
      .reduce((value, element) => value < element ? value : element);

  bool temHierarquiaMaiorOuIgualQue(Roles role) => hierarquia <= role.index;

  Map<String, dynamic> toJsonPostMethod() {
    final json = toJson();

    json.remove('uid');
    json.remove('criadoEm');
    json.remove('atualizadoEm');

    return json;
  }

  Map<String, dynamic> toJsonPutMethod() {
    final json = toJsonPostMethod();

    json.remove('account');
    json.remove('telefones');

    return json;
  }
}
