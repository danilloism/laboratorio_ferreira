import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

class DioService {
  late final Dio client;

  DioService() {
    client = Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
        responseType: ResponseType.json,
      ),
    );

    client.interceptors.add(LoggyDioInterceptor());
  }

  resetInterceptorsWithTokenOrNull([String? token]) {
    client.interceptors.removeRange(0, client.interceptors.length);
    if (token == null) {
      client.options.headers.remove('Authentication');
      return;
    }

    client.interceptors.add(InterceptorsWrapper(
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
          final refreshToken = await client.get<ApiResponse<Session>>(
              join(client.options.baseUrl, 'user', 'refresh'));
          final tokenNovo = refreshToken.data?.dados;
          if (tokenNovo != null) {
            client.options.headers['Authorization'] = 'Bearer $tokenNovo';
//TODO
            // await _localToken.reset(TokenModel(
            //     accessToken: tokenNovo.accessToken, roles: tokenNovo.roles!));

            final resposta = await client.request(
              opcoesReq!.path,
              data: opcoesReq.data,
              options: Options(
                method: opcoesReq.method,
                headers: client.options.headers,
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
}
