// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/auth/data/models/session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthModel _$$_AuthModelFromJson(Map<String, dynamic> json) => _$_AuthModel(
      contato: Contato.fromJson(json['contato'] as Object),
      accessToken: json['accessToken'] as String,
    );

const _$$_AuthModelFieldMap = <String, String>{
  'contato': 'contato',
  'accessToken': 'accessToken',
};

Map<String, dynamic> _$$_AuthModelToJson(_$_AuthModel instance) =>
    <String, dynamic>{
      'contato': instance.contato,
      'accessToken': instance.accessToken,
    };
