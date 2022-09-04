import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';

void main() {
  late Account account;
  late Faker faker;

  setUp(() {
    faker = Faker();
    account = genRandomAccount();
  });

  group('AccountModel', () {
    test('deve ser instanciado.', () {
      account = Account(email: '', senha: '');
      expect(account, isA<Account>());
    });

    test('fromJson && toJson devem fazer a conversão corretamente.', () {
      final json = account.toJson();

      account = Account.fromJson(json);

      expect(account.email, equals(json['email']));
      expect(account.senha, equals(json['senha']));
      expect(account.atualizadoEm, json['atualizadoEm']);
      expect(account.criadoEm, json['criadoEm']);
    });
  });
}

Account genRandomAccount() {
  return Account(
    email: faker.internet.email(),
    senha: faker.internet.password(),
    username: faker.internet.userName(),
  );
}
