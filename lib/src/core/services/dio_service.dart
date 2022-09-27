import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/core/services/i_http_service.dart';

class DioService implements IHttpService {
  final Dio _client;

  DioService(this._client);

  @override
  resetAuthTokenWithValueOrNull([String? token]) {
    const authHeader = 'Authorization';

    if (token == null) {
      _client.options.headers.remove(authHeader);
      return;
    }

    _client.options.headers[authHeader] = 'Bearer $token';
  }

  @override
  Future<Response> post(String path, {data}) async =>
      await _client.post(path, data: data);

  @override
  Future<Response> get(String path,
          {Map<String, dynamic>? queryParams}) async =>
      _client.get(path, queryParameters: queryParams);

  @override
  Future<Response> put(String path, {data}) => _client.put(path, data: data);

  @override
  String? get authorizationToken =>
      (_client.options.headers['Authorization'] as String?)?.split(' ')[1];

  @override
  Future<Response> patch(String path) => _client.patch(path);
}
