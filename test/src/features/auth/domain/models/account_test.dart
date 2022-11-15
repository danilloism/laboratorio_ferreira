import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/account.dart';

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

      final expected = Account.fromJson(json);

      expect(expected.email, equals(account.email));
      expect(expected.senha, equals(account.senha));
      expect(expected.atualizadoEm, equals(account.atualizadoEm));
      expect(expected.criadoEm, equals(account.criadoEm));
    });
  });
}

Account genRandomAccount() {
  return Account(
    email: 'Teste',
    senha: 'Teste',
    criadoEm: DateTime.now(),
    atualizadoEm: DateTime.now(),
  );
}
