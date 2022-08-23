import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/token.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/models/api_response_model.dart';
import 'package:path/path.dart';

class AuthRepository {
  final Dio _client;
  final _path = join(Config.apiUrl, 'user');

  AuthRepository({required Dio client}) : _client = client;

  Future<ApiResponse<Token?>> login(Account account) async {
    late final Response resposta;

    try {
      resposta = await _client.post(
        join(_path, 'login'),
        data: account.toJson(),
      );
    } on DioError catch (e) {
      return ApiResponse.fromJson(e.response?.data);
    }
    final retorno = ApiResponse<Token>.fromJson(resposta.data?.dados);

    return retorno;
  }

  Future<Token?> refresh(Account account) async {
    final res = await _client.patch<ApiResponse<Token>>(join(_path, 'refresh'));

    return res.data?.dados;
  }
}
