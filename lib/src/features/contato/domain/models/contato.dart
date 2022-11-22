import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';

part '../../../../../generated/src/features/contato/domain/models/contato.freezed.dart';
part '../../../../../generated/src/features/contato/domain/models/contato.g.dart';

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

  static Contato get empty => const Contato(
        nome: '',
        telefones: {},
        categorias: {},
        uid: '',
      );

  static Contato get emptyDentista => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.dentista},
        uid: '',
      );

  static Contato get emptyPaciente => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.paciente},
        uid: '',
      );

  static Contato get emptyDentistaEspacoOdontologico => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.dentista, Roles.colaborador},
        uid: '',
      );

  static Contato get emptyAdmin => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.admin},
        uid: '',
      );

  static Contato get emptyGerente => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.gerente},
        uid: '',
      );

  static Contato get emptyColaborador => const Contato(
        nome: '',
        telefones: {},
        categorias: {Roles.colaborador},
        uid: '',
      );
}

extension Methods on Contato {
  bool get isEmpty =>
      this == Contato.empty ||
      this == Contato.emptyDentista ||
      this == Contato.emptyPaciente ||
      this == Contato.emptyDentistaEspacoOdontologico ||
      this == Contato.emptyAdmin ||
      this == Contato.emptyGerente ||
      this == Contato.emptyColaborador;

  int get hierarquia => categorias.isEmpty
      ? 6
      : categorias
          .map((categoria) => categoria.index)
          .reduce((value, element) => value < element ? value : element);

  Roles get maiorRole => Roles.values[hierarquia];

  bool temHierarquiaMenorQue(Roles role) => hierarquia > role.index;

  bool temHierarquiaMaiorQue(Roles role) => hierarquia < role.index;

  bool temHierarquiaMenorOuIgualQue(Roles role) => hierarquia >= role.index;

  bool temHierarquiaMaiorOuIgualQue(Roles role) => hierarquia <= role.index;

  bool isA(Roles role) => categorias.contains(role);
  bool get isDentistaEspacoOdontologico =>
      categorias.contains(Roles.colaborador) &&
      categorias.contains(Roles.dentista);

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
    return json;
  }
}
