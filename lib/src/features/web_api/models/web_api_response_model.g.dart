// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebApiResponseModel _$WebApiResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WebApiResponseModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['sucesso', 'dados', 'mensagem', 'erros'],
        );
        final val = WebApiResponseModel(
          sucesso: $checkedConvert('sucesso', (v) => v as bool),
          dados: $checkedConvert('dados', (v) => v),
          mensagem: $checkedConvert('mensagem', (v) => v as String),
          erros: $checkedConvert('erros', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$WebApiResponseModelToJson(WebApiResponseModel instance) {
  final val = <String, dynamic>{
    'sucesso': instance.sucesso,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dados', instance.dados);
  val['mensagem'] = instance.mensagem;
  writeNotNull('erros', instance.erros);
  return val;
}
