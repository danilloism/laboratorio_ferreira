import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/api_response.dart';
import 'package:laboratorio_ferreira_mobile/src/core/services/i_http_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/models/contato.dart';
import 'package:path/path.dart';

class ContatoRepository {
  final IHttpService _httpService;
  final _path = join(Config.apiUrl, 'contatos');

  ContatoRepository({required IHttpService httpService})
      : _httpService = httpService;

  Future<ApiResponse<Contato?>> getOne(String uid) async {
    late final Response resposta;

    try {
      resposta = await _httpService.get(join(_path, uid));

      return ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
    } on DioError catch (e) {
      return ApiResponse<Contato?>.fromJson(e.response?.data, Contato.fromJson);
    }
  }

  Future<ApiResponse<Contato?>> update(Contato contato) async {
    if (contato.uid == null) {
      throw Exception('Uid do contato não deve ser nulo.');
    }

    late final Response resposta;

    try {
      final payload = contato.toJson();
      payload.remove('uid');
      payload.remove('account');
      payload.remove('telefones');
      payload.remove('criadoEm');
      payload.remove('atualizadoEm');

      resposta =
          await _httpService.put(join(_path, contato.uid), data: payload);

      return ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
    } on DioError catch (e) {
      return ApiResponse<Contato?>.fromJson(e.response?.data, Contato.fromJson);
    }
  }

  // Future<List<ContatoModel>?> getAll(
  //     {Map<String, dynamic>? queryParams}) async {
  //   final resposta = await _client.get<ApiResponse<ContatoModel>>(
  //     _path,
  //     queryParameters: queryParams,
  //   );
  //   return resposta.data?.dados;
  // }
}
