// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/network/models/api_response_model.dart';

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
      erro: json['erro'] as String?,
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
