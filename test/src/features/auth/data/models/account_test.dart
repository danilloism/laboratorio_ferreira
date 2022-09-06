import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

void main() {
  late Account account;

  setUp(() {
    account = genRandomAccount();
  });

  group('AccountModel', () {
    test('deve ser instanciado.', () {
      account = const Account(email: '', senha: '');
      expect(account, isA<Account>());
    });

    test('fromJson && toJson devem fazer a conversão corretamente.', () {
      final json = account.toJson();

      account = Account.fromJson(json);

      expect(account.email, equals(json['email']));
      expect(account.senha, equals(json['senha']));
      expect(account.atualizadoEm, json['atualizadoEm']);
      expect(account.criadoEm, json['criadoEm']);
      expect(account.contatoUid, json['contatoUid']);
    });
  });
}

Account genRandomAccount() {
  return Account(
    email: faker.internet.email(),
    senha: faker.internet.password(),
    contatoUid: faker.guid.guid(),
  );
}
