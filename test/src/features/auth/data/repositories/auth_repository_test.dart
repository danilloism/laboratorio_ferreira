import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../random_model_generators.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late final HttpServiceMock httpServiceMock;
  late final AuthRepository authRepository;

  setUpAll(() {
    httpServiceMock = HttpServiceMock();
    authRepository = AuthRepository(httpService: httpServiceMock);
  });

  group('login', () {
    test('deve fazer login', () async {
      when(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'sucesso': true,
              'dados': genRandomSession().toJson(),
            },
          ));

      final session =
          await authRepository.login(const Account(email: '', senha: ''));
      verify(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).called(1);
      verifyNever(() => httpServiceMock.get(
            any(),
            queryParams: any(named: 'queryParams'),
          ));
      verifyNever(() => httpServiceMock.put(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.patch(any()));

      expect(session, isA<Session>());
      expect(session, isNotNull);
      expect(session.accessToken, isA<String>());
      expect(session.accessToken, isNotNull);
      expect(session.accessToken, isNotEmpty);
      expect(session.contato, isA<Contato>());
      expect(session.contato, isNotNull);
      expect(session.contato.isEmpty, isFalse);
    });

    test('deve lançar excessão se sucesso for false', () {
      final data = {
        'sucesso': false,
        'mensagem': 'Erro ao realizaro operação',
        'erro': 'Usuário ou senha inválidos'
      };

      when(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: data,
          ));

      expect(() => authRepository.login(const Account(email: '', senha: '')),
          throwsA(isA<RepositoryException>()));
      verify(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).called(1);
      verifyNever(() => httpServiceMock.get(
            any(),
            queryParams: any(named: 'queryParams'),
          ));
      verifyNever(() => httpServiceMock.put(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.patch(any()));
    });

    test('deve lançar assertion se senha for null', () {
      expect(
        () => authRepository.login(const Account(email: '')),
        throwsAssertionError,
      );
      verifyNever(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.get(
            any(),
            queryParams: any(named: 'queryParams'),
          ));
      verifyNever(() => httpServiceMock.put(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.patch(any()));
    });

    test('deve lançar RepositoryException se cliente lançar um erro', () {
      when(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
      ));

      expect(() => authRepository.login(const Account(email: '', senha: '')),
          throwsA(isA<RepositoryException>()));
      verify(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).called(1);
      verifyNever(() => httpServiceMock.get(
            any(),
            queryParams: any(named: 'queryParams'),
          ));
      verifyNever(() => httpServiceMock.put(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.patch(any()));
    });

    test('deve relançar exception se não for erro do cliente', () {
      when(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).thenThrow(const FormatException());

      expect(() => authRepository.login(const Account(email: '', senha: '')),
          throwsA(isA<FormatException>()));
      verify(() => httpServiceMock.post(
            any(),
            data: any(named: 'data'),
          )).called(1);
      verifyNever(() => httpServiceMock.get(
            any(),
            queryParams: any(named: 'queryParams'),
          ));
      verifyNever(() => httpServiceMock.put(
            any(),
            data: any(named: 'data'),
          ));
      verifyNever(() => httpServiceMock.patch(any()));
    });
  });
}
