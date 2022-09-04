import 'package:laboratorio_ferreira_mobile/src/core/extensions/map_extension.dart';

class RepositoryException implements Exception {
  late final String? message;
  RepositoryException({
    Map<String, dynamic>? error,
    Type? whichRepository,
  }) {
    error?['Repository:'] = whichRepository.toString();
    message = error?.formattedString;
  }
}
