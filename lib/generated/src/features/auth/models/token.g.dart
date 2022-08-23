// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/auth/models/token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['accessToken'],
  );
  return _$_Token(
    json['accessToken'] as String,
  );
}

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };
