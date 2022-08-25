import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';

part '../../../../generated/src/features/contato/models/contato.freezed.dart';
part '../../../../generated/src/features/contato/models/contato.g.dart';

@freezed
class Contato with _$Contato {
  @HiveType(typeId: 3)
  const factory Contato({
    @HiveField(0) required String nome,
    @HiveField(1) required List<String> telefones,
    @HiveField(2) required List<RolesEnum> categorias,
    @HiveField(3) bool? ativo,
    @HiveField(4) Account? account,
    @HiveField(5) String? uid,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) = _Contato;

  factory Contato.fromJson(Object? json) =>
      _$ContatoFromJson(json as Map<String, dynamic>);
}
