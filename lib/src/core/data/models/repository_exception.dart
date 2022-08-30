class RepositoryException implements Exception {
  late final String message;
  RepositoryException({int? statusCode, String? mensagem, dynamic erro}) {
    message = formatDioException(
      statusCode: statusCode,
      mensagem: mensagem,
      erro: erro,
    );
  }

  String formatDioException(
          {int? statusCode, String? mensagem, dynamic erro}) =>
      '''
Aconteceu um erro!
Código: $statusCode;
Mensagem: $mensagem;
Erro: ${erro.toString()}.
''';
}
