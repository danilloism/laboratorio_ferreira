import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/application.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late final HttpServiceMock httpServiceMock;
  late final AuthRepository authRepository;

  setUpAll(() {
    httpServiceMock = HttpServiceMock();
    // authRepository = AuthRepository(httpService: httpServiceMock);
  });
}
