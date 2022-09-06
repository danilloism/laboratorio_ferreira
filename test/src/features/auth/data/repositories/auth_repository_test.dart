import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:mocktail/mocktail.dart';

class DioServiceMock extends Mock implements DioService {}

void main() {
  late final DioServiceMock dioServiceMock;
  late final AuthRepository authRepository;

  setUpAll(() {
    dioServiceMock = DioServiceMock();
    authRepository = AuthRepository(httpService: dioServiceMock);
  });
}
