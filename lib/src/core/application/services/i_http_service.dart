import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/config/constants.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/dio_service.dart';

abstract class IHttpService {
  String? get authorizationToken;
  resetAuthTokenWithValueOrNull([String? token]);
  Future post(String path, {dynamic data});
  Future get(String path, {Map<String, dynamic>? queryParams});
  Future put(String path, {dynamic data});

  Future patch(String path);
}

final httpServiceProvider = Provider<IHttpService>((ref) => DioService(Dio(
      BaseOptions(
        baseUrl: Constants.apiUrl,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(LoggyDioInterceptor())));
