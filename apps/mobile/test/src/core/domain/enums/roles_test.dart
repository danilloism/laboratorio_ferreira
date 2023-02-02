import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';

void main() {
  late Roles role;

  setUp(() {
    role = Roles.admin;
  });
  group('Enum Roles', () {
    group('getter', () {
      group('capitalized', () {
        test('deve retornar o enum com letra maíuscula.', () {
          final capitalized = role.capitalized;
          final primeiroChar = capitalized[0];
          final restoString = capitalized.substring(1);

          expect(primeiroChar, equals(role.name[0].toUpperCase()));
          expect(restoString, equals(role.name.substring(1)));
        });
      });
    });
  });
}
