class WebApiResponseModel<T> {
  final bool sucesso;
  final T? dados;
  final String mensagem;
  final dynamic erros;

  const WebApiResponseModel({
    required this.sucesso,
    this.dados,
    required this.mensagem,
    this.erros,
  });

  factory WebApiResponseModel.fromJson(Map<String, dynamic> json) =>
      WebApiResponseModel(
        sucesso: json['sucesso'],
        mensagem: json['mensagem'],
        erros: json['erros'],
        dados: json['dados'],
      );
}
