// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AccountModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'email',
            'senha',
            'username',
            'contatoUid',
            'criadoEm',
            'atualizadoEm'
          ],
        );
        final val = AccountModel(
          contatoUid: $checkedConvert('contatoUid', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String?),
          senha: $checkedConvert('senha', (v) => v as String),
          criadoEm: $checkedConvert('criadoEm',
              (v) => v == null ? null : DateTime.parse(v as String)),
          atualizadoEm: $checkedConvert('atualizadoEm',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'senha': instance.senha,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('contatoUid', instance.contatoUid);
  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  return val;
}
