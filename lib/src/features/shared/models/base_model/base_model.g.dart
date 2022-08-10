// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'criadoEm': instance.criadoEm?.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
    };
