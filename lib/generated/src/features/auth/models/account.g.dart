// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/auth/models/account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<_$_Account> {
  @override
  final int typeId = 1;

  @override
  _$_Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Account(
      email: fields[0] as String,
      senha: fields[1] as String?,
      criadoEm: fields[2] as DateTime?,
      atualizadoEm: fields[3] as DateTime?,
      contatoUid: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Account obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.senha)
      ..writeByte(2)
      ..write(obj.criadoEm)
      ..writeByte(3)
      ..write(obj.atualizadoEm)
      ..writeByte(4)
      ..write(obj.contatoUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
