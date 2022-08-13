// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      contatoUid: json['contatoUid'] as String?,
      email: json['email'] as String,
      username: json['username'] as String?,
      senha: json['senha'] as String,
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'senha': instance.senha,
      'username': instance.username,
      'contatoUid': instance.contatoUid,
      'criadoEm': instance.criadoEm?.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
    };
