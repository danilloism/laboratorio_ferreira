import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/exceptions/repository_exception.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/services/dio_service.dart';
import 'package:path/path.dart';

class ApiAuthRepository {
  final DioService _httpService;
  final _path = join(Config.apiUrl, 'user');

  ApiAuthRepository({required DioService dioService})
      : _httpService = dioService;

  resetHttpClientToken([String? token]) {
    _httpService.resetInterceptorsWithTokenOrNull(token);
  }

  Future<Session> login(Account account) async {
    late final Response resposta;

    try {
      resposta = await _httpService.client.post(
        join(_path, 'login'),
        data: account.toJson(),
      );

      final dto =
          ApiResponse<Session>.fromJson(resposta.data, Session.fromJson);
      if (dto.sucesso) {
        final session = dto.dados!;
        resetHttpClientToken(session.accessToken);
        return session;
      }

      throw Exception(dto.erro.toString());
    } on DioError catch (e) {
      final dto =
          ApiResponse<Session?>.fromJson(e.response?.data, Session.fromJson);

      throw RepositoryException(
        statusCode: e.response?.statusCode,
        mensagem: dto.mensagem,
        erro: dto.erro,
      );
    } catch (e) {
      rethrow;
    }
  }
}
