import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/i_http_service.dart';

class DioService implements IHttpService {
  final Dio client;

  DioService(this.client);

  @override
  Future<Response> post(String path, {data}) async =>
      await client.post(path, data: data);

  @override
  Future<Response> get(String path,
          {Map<String, dynamic>? queryParams}) async =>
      client.get(path, queryParameters: queryParams);

  @override
  Future<Response> put(String path, {data}) => client.put(path, data: data);

  @override
  String? get authorizationToken =>
      (client.options.headers['Authorization'] as String?)?.split(' ')[1];

  @override
  Future<Response> patch(String path) => client.patch(path);
}
