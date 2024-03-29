import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/i_http_service.dart';

class DioService implements IHttpService {
  final Dio client;
  final CancelToken? cancelToken;
  DioService(this.client, {this.cancelToken});

  @override
  Future<Response> post(String path, {data}) async =>
      await client.post(path, data: data, cancelToken: cancelToken);

  @override
  Future<Response> get(String path,
          {Map<String, dynamic>? queryParams}) async =>
      client.get(path, queryParameters: queryParams, cancelToken: cancelToken);

  @override
  Future<Response> put(String path, {data}) =>
      client.put(path, data: data, cancelToken: cancelToken);

  @override
  String? get authorizationToken =>
      (client.options.headers['Authorization'] as String?)?.split(' ')[1];

  @override
  Future<Response> patch(String path) =>
      client.patch(path, cancelToken: cancelToken);
}
