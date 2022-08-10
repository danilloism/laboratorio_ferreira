// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebApiResponseModel _$WebApiResponseModelFromJson(Map<String, dynamic> json) =>
    WebApiResponseModel(
      sucesso: json['sucesso'] as bool,
      dados: json['dados'],
      mensagem: json['mensagem'] as String,
      erros: json['erros'],
    );

Map<String, dynamic> _$WebApiResponseModelToJson(
        WebApiResponseModel instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
      'dados': instance.dados,
      'mensagem': instance.mensagem,
      'erros': instance.erros,
    };
