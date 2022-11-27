import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:laboratorio_ferreira_mobile/environment.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/dio_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../generated/src/core/application/services/i_http_service.g.dart';

abstract class IHttpService {
  String? get authorizationToken;
  Future post(String path, {dynamic data});
  Future get(String path, {Map<String, dynamic>? queryParams});
  Future put(String path, {dynamic data});
  Future patch(String path);
}

@Riverpod(keepAlive: true)
IHttpService httpService(HttpServiceRef ref) {
  return DioService(
    ref.read(dioProvider),
    cancelToken: ref.read(cancelTokenProvider),
  );
}

@riverpod
Dio dio(DioRef ref) {
  final token = ref.watch(
      settingsControllerProvider.select((value) => value.session?.accessToken));

  final headers = token != null ? {'Authorization': 'Bearer $token'} : null;

  return Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      responseType: ResponseType.json,
      headers: headers,
    ),
  )..interceptors.add(LoggyDioInterceptor());
}

@riverpod
CancelToken cancelToken(CancelTokenRef ref) => CancelToken();
