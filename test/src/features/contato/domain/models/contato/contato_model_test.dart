import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato/contato_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/shared/enums/roles_enum.dart';

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
    test('deve estar instanciado.', () => expect(contato, isA<ContatoModel>()));

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
