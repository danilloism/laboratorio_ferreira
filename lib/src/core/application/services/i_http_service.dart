import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/consts.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/dio_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../generated/src/core/application/services/i_http_service.g.dart';

abstract class IHttpService {
  String? get authorizationToken;
  Future post(String path, {dynamic data});
  Future get(String path, {Map<String, dynamic>? queryParams});
  Future put(String path, {dynamic data});
  Future patch(String path);
}

@riverpod
IHttpService httpService(HttpServiceRef ref) {
  return DioService(
    ref.watch(dioProvider),
    cancelToken: CancelToken(),
  );
}

@riverpod
Dio dio(DioRef ref) {
  final token = ref.watch(tokenProvider);

  final headers = token != null ? {'Authorization': 'Bearer $token'} : null;

  final client = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      responseType: ResponseType.json,
      headers: headers,
    ),
  );

  if (!Environment.isProduction) {
    client.interceptors.add(PrettyDioLogger());
  }

  return client;
}
