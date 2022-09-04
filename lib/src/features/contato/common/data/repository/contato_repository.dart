import 'package:dio/dio.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/data/models/contato.dart';
import 'package:path/path.dart';

class ContatoRepository {
  final IHttpService _httpService;
  final _path = join(Config.apiUrl, 'contatos');

  ContatoRepository({required IHttpService httpService})
      : _httpService = httpService;

  Future<Contato> getOne(String uid) async {
    try {
      final path = join(_path, uid);
      final Response resposta = await _httpService.get(path);

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        error: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      throw RepositoryException(
        error: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Contato> update(Contato contato) async {
    try {
      final payload = contato.toJsonPutMethod();

      final Response resposta =
          await _httpService.put(join(_path, contato.uid), data: payload);

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);
      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        error: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      throw RepositoryException(
        error: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Contato>> getMany({Map<String, dynamic>? queryParams}) async {
    try {
      final Response resposta =
          await _httpService.get(_path, queryParams: queryParams);
      final dto = ApiResponse<List<Contato>>.fromJson(
          resposta.data, Contato.fromJsonList);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        error: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      throw RepositoryException(
        error: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }
}
