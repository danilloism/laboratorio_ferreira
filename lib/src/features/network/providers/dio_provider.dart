import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/auth_response.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/token_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

final dioProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Config.apiUrl,
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.headers['Authorization'] == null) {
          final tokenFromNotifier = ref.watch(tokenNotifierProvider);
          options.headers['Authorization'] = tokenFromNotifier;
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
          final refreshToken = await dio.get<ApiResponse<AuthResponse>>(
              join(dio.options.baseUrl, 'user', 'refresh'));
          final tokenNovo = refreshToken.data?.dados;
          if (tokenNovo != null) {
            dio.options.headers['Authorization'] = 'Bearer $tokenNovo';
//TODO
            // await _localToken.reset(TokenModel(
            //     accessToken: tokenNovo.accessToken, roles: tokenNovo.roles!));

            final resposta = await dio.request(
              opcoesReq!.path,
              options: Options(
                method: opcoesReq.method,
                headers: dio.options.headers,
              ),
            );

            final dto = resposta.data as ApiResponse<AuthResponse?>;

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
    ),
  );

  return dio;
});
