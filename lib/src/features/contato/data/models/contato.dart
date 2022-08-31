import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';

part '../../../../../generated/src/features/contato/data/models/contato.freezed.dart';
part '../../../../../generated/src/features/contato/data/models/contato.g.dart';

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
}
