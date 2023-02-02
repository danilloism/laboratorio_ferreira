// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/auth/domain/models/session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthModel _$$_AuthModelFromJson(Map<String, dynamic> json) => _$_AuthModel(
      accessToken: json['accessToken'] as String,
      contato: Contato.fromJson(json['contato'] as Object),
    );

const _$$_AuthModelFieldMap = <String, String>{
  'accessToken': 'accessToken',
  'contato': 'contato',
};

Map<String, dynamic> _$$_AuthModelToJson(_$_AuthModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'contato': instance.contato.toJson(),
    };
