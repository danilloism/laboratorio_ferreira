import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/config/environment.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:path/path.dart';

class ContatoRepository {
  final IHttpService _httpService;
  final _path = join(Environment.apiUrl, 'contatos');

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
        object: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
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
        object: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
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
        object: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
          'data': e.response?.data,
          'statusCode': e.response?.statusCode,
        },
        whichRepository: ContatoRepository,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Contato> create(Contato contato) async {
    try {
      final Response resposta =
          await _httpService.post(_path, data: contato.toJsonPostMethod());

      final dto =
          ApiResponse<Contato>.fromJson(resposta.data, Contato.fromJson);

      if (dto.sucesso) {
        return dto.dados!;
      }

      throw RepositoryException(
        object: resposta.data,
        whichRepository: ContatoRepository,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        rethrow;
      }

      throw RepositoryException(
        object: {
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

final contatoRepositoryProvider = Provider.autoDispose(
    (ref) => ContatoRepository(httpService: ref.watch(httpServiceProvider)));
