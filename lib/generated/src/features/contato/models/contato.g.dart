// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/contato/models/contato.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContatoAdapter extends TypeAdapter<Contato> {
  @override
  final int typeId = 3;

  @override
  Contato read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contato(
      nome: fields[0] as String,
      telefones: (fields[1] as List).cast<String>(),
      categorias: (fields[2] as List).cast<RolesEnum>(),
      ativo: fields[3] as bool?,
      account: fields[4] as Account?,
    );
  }

  @override
  void write(BinaryWriter writer, Contato obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.telefones)
      ..writeByte(2)
      ..write(obj.categorias)
      ..writeByte(3)
      ..write(obj.ativo)
      ..writeByte(4)
      ..write(obj.account);
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

Contato _$ContatoFromJson(Map<String, dynamic> json) => Contato(
      uid: json['uid'] as String?,
      nome: json['nome'] as String,
      telefones:
          (json['telefones'] as List<dynamic>).map((e) => e as String).toList(),
      categorias: (json['categorias'] as List<dynamic>)
          .map((e) => $enumDecode(_$RolesEnumEnumMap, e))
          .toList(),
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
      ativo: json['ativo'] as bool?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
    );

const _$ContatoFieldMap = <String, String>{
  'criadoEm': 'criadoEm',
  'atualizadoEm': 'atualizadoEm',
  'uid': 'uid',
  'nome': 'nome',
  'telefones': 'telefones',
  'categorias': 'categorias',
  'ativo': 'ativo',
  'account': 'account',
};

Map<String, dynamic> _$ContatoToJson(Contato instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  writeNotNull('uid', instance.uid);
  val['nome'] = instance.nome;
  val['telefones'] = instance.telefones;
  val['categorias'] =
      instance.categorias.map((e) => _$RolesEnumEnumMap[e]!).toList();
  writeNotNull('ativo', instance.ativo);
  writeNotNull('account', instance.account);
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
