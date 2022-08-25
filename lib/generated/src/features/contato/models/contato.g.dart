// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/contato/models/contato.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContatoAdapter extends TypeAdapter<_$_Contato> {
  @override
  final int typeId = 3;

  @override
  _$_Contato read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Contato(
      nome: fields[0] as String,
      telefones: (fields[1] as List).cast<String>(),
      categorias: (fields[2] as List).cast<RolesEnum>(),
      ativo: fields[3] as bool?,
      account: fields[4] as Account?,
      uid: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Contato obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(3)
      ..write(obj.ativo)
      ..writeByte(4)
      ..write(obj.account)
      ..writeByte(5)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.telefones)
      ..writeByte(2)
      ..write(obj.categorias);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContatoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
