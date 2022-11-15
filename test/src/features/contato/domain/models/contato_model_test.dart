import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

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
      expect(
          contatoFromJson.telefones.length, equals(contato.telefones.length));
      expect(
          contatoFromJson.categorias.length, equals(contato.categorias.length));
    });
  });
}

Contato genRandomContato() {
  final rand = Random().nextInt(Roles.values.length);

  return Contato(
    nome: 'Teste',
    telefones: {'655656565', '854564456'},
    categorias: List.generate(20, (_) => Roles.values[rand]).toSet(),
    uid: faker.guid.guid(),
  );
}
