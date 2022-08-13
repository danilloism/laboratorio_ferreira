import 'package:json_annotation/json_annotation.dart';

part 'web_api_response_model.g.dart';

@JsonSerializable()
class WebApiResponseModel {
  final bool sucesso;
  final dynamic dados;
  final String mensagem;
  final dynamic erros;

  WebApiResponseModel({
    required this.sucesso,
    this.dados,
    required this.mensagem,
    this.erros,
  });

  T dadosTipados<T>() => dados as T;
}
