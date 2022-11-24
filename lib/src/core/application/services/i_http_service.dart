import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/config/environment.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/dio_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';

abstract class IHttpService {
  String? get authorizationToken;
  Future post(String path, {dynamic data});
  Future get(String path, {Map<String, dynamic>? queryParams});
  Future put(String path, {dynamic data});
  Future patch(String path);
  final CancelToken? cancelToken = null;
}

final httpServiceProvider = Provider<IHttpService>((ref) {
  final token = ref.watch(
      settingsNotifierProvider.select((value) => value.session?.accessToken));

  final headers = token != null ? {'Authorization': 'Bearer $token'} : null;

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      responseType: ResponseType.json,
      headers: headers,
    ),
  )..interceptors.add(LoggyDioInterceptor());

  final service = DioService(dio);
  ref.onDispose(() {
    // service.cancelToken?.cancel();
    dio.close();
  });
  return service;
});
