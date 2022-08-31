// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/contato/data/models/contato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contato _$$_ContatoFromJson(Map<String, dynamic> json) => _$_Contato(
      nome: json['nome'] as String,
      telefones:
          (json['telefones'] as List<dynamic>).map((e) => e as String).toSet(),
      categorias: (json['categorias'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumMap, e))
          .toSet(),
      uid: json['uid'] as String,
      ativo: json['ativo'] as bool?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
    );

const _$$_ContatoFieldMap = <String, String>{
  'nome': 'nome',
  'telefones': 'telefones',
  'categorias': 'categorias',
  'uid': 'uid',
  'ativo': 'ativo',
  'account': 'account',
  'criadoEm': 'criadoEm',
  'atualizadoEm': 'atualizadoEm',
};

Map<String, dynamic> _$$_ContatoToJson(_$_Contato instance) {
  final val = <String, dynamic>{
    'nome': instance.nome,
    'telefones': instance.telefones.toList(),
    'categorias': instance.categorias.map((e) => _$RolesEnumMap[e]!).toList(),
    'uid': instance.uid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ativo', instance.ativo);
  writeNotNull('account', instance.account);
  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  return val;
}

const _$RolesEnumMap = {
  Roles.admin: 'ADMIN',
  Roles.gerente: 'GERENTE',
  Roles.colaborador: 'COLABORADOR',
  Roles.dentista: 'DENTISTA',
  Roles.paciente: 'PACIENTE',
  Roles.entregador: 'ENTREGADOR',
  Roles.fornecedor: 'FORNECEDOR',
};
