import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/models/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';

part '../../../../generated/src/features/contato/models/contato.freezed.dart';
part '../../../../generated/src/features/contato/models/contato.g.dart';

@freezed
class Contato with _$Contato {
  const factory Contato({
    required String nome,
    required List<String> telefones,
    required List<RolesEnum> categorias,
    bool? ativo,
    Account? account,
    String? uid,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) = _Contato;

  factory Contato.fromJson(Object? json) =>
      _$ContatoFromJson(json as Map<String, dynamic>);
}
