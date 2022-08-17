import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato/contato_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';

void main() {
  late ContatoModel contato;
  late Faker faker;

  setUpAll(() {
    faker = Faker();
  });

  setUp(() {
    contato = genRandomContato();
  });

  group('ContatoModel', () {
    test(
      'deve estar instanciado.',
      () => expect(
        contato,
        allOf([
          isA<ContatoModel>(),
          isNotNull,
        ]),
      ),
    );

    group('telefones', () {
      test('deve retornar tipo Set',
          () => expect(contato.telefones, isA<Set>()));
      test('deve incrementar o tamanho ao adicionar novo(s) telefone(s)', () {
        int anterior = contato.telefones.length;
        Iterable<String> telefones = [];

        contato.addTelefones(telefones);
        expect(contato.telefones.length, equals(anterior));

        telefones = [faker.phoneNumber.us()];
        contato.addTelefones(telefones);
        anterior += telefones.length;
        expect(contato.telefones.length, equals(anterior));

        telefones = List.generate(5, (_) => faker.phoneNumber.us()).toSet();
        contato.addTelefones(telefones);
        anterior += telefones.length;
        expect(contato.telefones.length, equals(anterior));
      });
    });

    test('toJson && fromJson devem fazer a conversão corretamente', () {
      final json = contato.toJson();

      final contatoFromJson = ContatoModel.fromJson(json);

      final categoriaFromJson = json['categorias'][0] as String;
      final categoriaFromInstance = contato.categorias.toList()[0].name;

      expect(categoriaFromJson, equals(categoriaFromInstance.toUpperCase()));
      expect(categoriaFromJson, isNot(categoriaFromInstance));
      expect(contatoFromJson, equals(contato));
    });
  });
}

ContatoModel genRandomContato() {
  final rand = Random().nextInt(RolesEnum.values.length);

  return ContatoModel(
    nome: faker.person.name(),
    telefones: List.generate(3, (_) => faker.phoneNumber.us()),
    categorias: List.generate(20, (_) => RolesEnum.values[rand]),
  );
}
