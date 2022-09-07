import 'package:laboratorio_ferreira_mobile/src/core/extensions/map_extension.dart';

class RepositoryException implements Exception {
  late final String? message;
  final Map<String, dynamic>? object;

  RepositoryException({
    this.object,
    Type? whichRepository,
  }) {
    object?['Repository'] = whichRepository.toString();
    message = object?.formattedString;
  }
}
