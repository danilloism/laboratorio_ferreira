// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'criadoEm',
      'atualizadoEm',
      'email',
      'senha',
      'username'
    ],
  );
  return AccountModel(
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
}

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  val['email'] = instance.email;
  val['senha'] = instance.senha;
  writeNotNull('username', instance.username);
  return val;
}
