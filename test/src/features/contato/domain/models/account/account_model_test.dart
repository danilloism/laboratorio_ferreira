import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/account/account_model.dart';

void main() {
  late AccountModel account;
  late Faker faker;

  setUp(() {
    faker = Faker();
    account = genRandomAccount();
  });

  group('AccountModel', () {
    test('deve ser instanciado.', () {
      account = AccountModel(email: '', senha: '');
      expect(account, isA<AccountModel>());
    });

    test('fromJson && toJson', () {
      final json = account.toJson();

      account = AccountModel.fromJson(json);

      expect(account.email, equals(json['email']));
      expect(account.senha, equals(json['senha']));
      expect(account.atualizadoEm, json['atualizadoEm']);
      expect(account.criadoEm, json['criadoEm']);
      expect(account.contatoUid, json['contatoUid']);
    });
  });
}

AccountModel genRandomAccount() {
  return AccountModel(
      email: faker.internet.email(),
      senha: faker.internet.password(),
      username: faker.internet.userName(),
      contatoUid: faker.guid.guid());
}
