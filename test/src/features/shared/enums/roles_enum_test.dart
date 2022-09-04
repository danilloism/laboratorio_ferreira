import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/models/roles.dart';

void main() {
  group('RolesEnum', () {
    test('deve começar com letra maíuscula ao chamar getter capitalized', () {
      final roleCapitalized = RolesEnum.admin.capitalized;
      expect(roleCapitalized, equals('Admin'));
    });
  });
}
