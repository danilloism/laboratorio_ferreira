import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/api_response.dart';
import 'package:laboratorio_ferreira_mobile/src/core/services/i_http_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';
import 'package:path/path.dart';

class DioService implements IHttpService {
  late final Dio _client;

  DioService() {
    _client = Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
        responseType: ResponseType.json,
      ),
    );

    _client.interceptors.add(LoggyDioInterceptor());
  }

  @override
  resetInterceptorsWithTokenOrNull([String? token]) {
    _client.interceptors.removeRange(0, _client.interceptors.length);
    if (token == null) {
      _client.options.headers.remove('Authentication');
      return;
    }

    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.headers['Authorization'] == null) {
          options.headers['Authorization'] = token;
        }

        return handler.next(options);
      },
      onError: (err, handler) async {
        final String? reqToken = err.requestOptions.headers['Authorization'];
        final status = err.response?.statusCode;

        if (reqToken != null &&
            JwtDecoder.isExpired(reqToken) && //TODO: arrumar isso aqui
            (status == 403 || status == 401)) {
          final opcoesReq = err.response?.requestOptions;
          final refreshToken = await _client.get<ApiResponse<Session>>(
              join(_client.options.baseUrl, 'user', 'refresh'));
          final tokenNovo = refreshToken.data?.dados;
          if (tokenNovo != null) {
            _client.options.headers['Authorization'] = 'Bearer $tokenNovo';
//TODO
            // await _localToken.reset(TokenModel(
            //     accessToken: tokenNovo.accessToken, roles: tokenNovo.roles!));

            final resposta = await _client.request(
              opcoesReq!.path,
              data: opcoesReq.data,
              options: Options(
                method: opcoesReq.method,
                headers: _client.options.headers,
              ),
            );

            final dto = resposta.data as ApiResponse<Session?>;

            if (dto.sucesso) {
              handler.resolve(resposta);
              return;
            }

            return handler.next(
              DioError(
                requestOptions: resposta.requestOptions,
                error: dto.erro,
                response: resposta,
              ),
            );
          }

          return handler.next(
            DioError(
              requestOptions: opcoesReq!,
              error: refreshToken.data?.erro,
            ),
          );
        }

        return handler.next(err);
      },
    ));
  }

  @override
  Future<Response> post(String path, {data}) async =>
      await _client.post(path, data: data);

  @override
  Future<Response> get(String path,
          {Map<String, dynamic>? queryParams}) async =>
      _client.get(path, queryParameters: queryParams);

  @override
  Future put(String path, {data}) => _client.put(path, data: data);

  @override
  String? get authorizationToken =>
      (_client.options.headers['Authorization'] as String?)?.split(' ')[0];
}
