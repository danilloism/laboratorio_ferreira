import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/data/models/contato.dart';

void main() {
  late Contato contato;

  setUp(() {
    contato = genRandomContato();
  });

  group('Contato', () {
    test(
      'deve estar instanciado.',
      () => expect(
        contato,
        allOf([
          isA<Contato>(),
          isNotNull,
        ]),
      ),
    );

    test('toJson && fromJson devem fazer a conversão corretamente', () {
      final json = contato.toJson();

      final contatoFromJson = Contato.fromJson(json);

      final categoriaFromJson = json['categorias'][0] as String;
      final categoriaFromInstance = contato.categorias.toList()[0].name;

      expect(categoriaFromJson, equals(categoriaFromInstance.toUpperCase()));
      expect(categoriaFromJson, isNot(categoriaFromInstance));
      expect(contatoFromJson, equals(contato));
    });
  });
}

Contato genRandomContato() {
  final rand = Random().nextInt(Roles.values.length);

  return Contato(
    nome: faker.person.name(),
    telefones: List.generate(3, (_) => faker.phoneNumber.us()).toSet(),
    categorias: List.generate(20, (_) => Roles.values[rand]).toSet(),
    uid: faker.guid.guid(),
  );
}
