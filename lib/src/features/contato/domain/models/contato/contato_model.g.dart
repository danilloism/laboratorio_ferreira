// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoModel _$ContatoModelFromJson(Map<String, dynamic> json) => ContatoModel(
      uid: json['uid'] as String?,
      nome: json['nome'] as String,
      telefones: (json['telefones'] as List<dynamic>).map((e) => e as String),
      categorias: (json['categorias'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumEnumMap, e)),
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
      ativo: json['ativo'] as bool?,
      account: json['account'] == null
          ? null
          : AccountModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContatoModelToJson(ContatoModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nome': instance.nome,
      'ativo': instance.ativo,
      'account': instance.account,
      'criadoEm': instance.criadoEm?.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
      'telefones': instance.telefones.toList(),
      'categorias':
          instance.categorias.map((e) => _$RolesEnumEnumMap[e]!).toList(),
    };

const _$RolesEnumEnumMap = {
  RolesEnum.admin: 'ADMIN',
  RolesEnum.gerente: 'GERENTE',
  RolesEnum.colaborador: 'COLABORADOR',
  RolesEnum.dentista: 'DENTISTA',
  RolesEnum.paciente: 'PACIENTE',
  RolesEnum.entregador: 'ENTREGADOR',
  RolesEnum.fornecedor: 'FORNECEDOR',
};
