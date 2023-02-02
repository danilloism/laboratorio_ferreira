import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/account.dart';

import '../../../../../helpers/random_model_generators.dart';

void main() {
  late Account account;

  setUp(() {
    account = genRandomAccount();
  });

  group('AccountModel', () {
    test('deve ser instanciado.', () {
      expect(
          account,
          allOf([
            isA<Account>(),
            isNotNull,
          ]));
    });

    test('fromJson && toJson devem fazer a conversão corretamente.', () {
      final json = account.toJson();

      final accountFromJson = Account.fromJson(json);

      expect(accountFromJson, equals(account));
    });
  });
}
