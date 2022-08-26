// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/auth/data/models/account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      email: json['email'] as String,
      senha: json['senha'] as String?,
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
      contatoUid: json['contatoUid'] as String?,
    );

const _$$_AccountFieldMap = <String, String>{
  'email': 'email',
  'senha': 'senha',
  'criadoEm': 'criadoEm',
  'atualizadoEm': 'atualizadoEm',
  'contatoUid': 'contatoUid',
};

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) {
  final val = <String, dynamic>{
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('senha', instance.senha);
  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  writeNotNull('contatoUid', instance.contatoUid);
  return val;
}
