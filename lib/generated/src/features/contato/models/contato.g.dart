// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/contato/models/contato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contato _$$_ContatoFromJson(Map<String, dynamic> json) => _$_Contato(
      nome: json['nome'] as String,
      telefones:
          (json['telefones'] as List<dynamic>).map((e) => e as String).toList(),
      categorias: (json['categorias'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumEnumMap, e))
          .toList(),
      ativo: json['ativo'] as bool?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      uid: json['uid'] as String?,
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
  'ativo': 'ativo',
  'account': 'account',
  'uid': 'uid',
  'criadoEm': 'criadoEm',
  'atualizadoEm': 'atualizadoEm',
};

Map<String, dynamic> _$$_ContatoToJson(_$_Contato instance) {
  final val = <String, dynamic>{
    'nome': instance.nome,
    'telefones': instance.telefones,
    'categorias':
        instance.categorias.map((e) => _$RolesEnumEnumMap[e]!).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ativo', instance.ativo);
  writeNotNull('account', instance.account);
  writeNotNull('uid', instance.uid);
  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  return val;
}

const _$RolesEnumEnumMap = {
  RolesEnum.admin: 'ADMIN',
  RolesEnum.gerente: 'GERENTE',
  RolesEnum.colaborador: 'COLABORADOR',
  RolesEnum.dentista: 'DENTISTA',
  RolesEnum.paciente: 'PACIENTE',
  RolesEnum.entregador: 'ENTREGADOR',
  RolesEnum.fornecedor: 'FORNECEDOR',
};
