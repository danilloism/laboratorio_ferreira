// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/core/data/models/api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse<T> _$$_ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ApiResponse<T>(
      sucesso: json['sucesso'] as bool,
      dados: _$nullableGenericFromJson(json['dados'], fromJsonT),
      mensagem: json['mensagem'] as String?,
      erro: json['erro'],
    );

const _$$_ApiResponseFieldMap = <String, String>{
  'sucesso': 'sucesso',
  'dados': 'dados',
  'mensagem': 'mensagem',
  'erro': 'erro',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
