import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/enums/enums.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

import '../../../../../random_model_generators.dart';

void main() {
  late Contato contato;

  setUpAll(() {
    contato = genRandomContato();
  });

  group('Contato', () {
    group('objeto', () {
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

      test('deve vir vazio ao usar getters estáticos.', () {
        final contatoVazio = Contato.empty;
        final adminVazio = Contato.emptyAdmin;
        final colabVazio = Contato.emptyColaborador;
        final dentVazio = Contato.emptyDentista;
        final dentEspVazio = Contato.emptyDentistaEspacoOdontologico;
        final gerenteVazio = Contato.emptyGerente;
        final pacienteVazio = Contato.emptyPaciente;

        expect(contatoVazio.isEmpty, isTrue);
        expect(adminVazio.isEmpty, isTrue);
        expect(colabVazio.isEmpty, isTrue);
        expect(dentVazio.isEmpty, isTrue);
        expect(dentEspVazio.isEmpty, isTrue);
        expect(gerenteVazio.isEmpty, isTrue);
        expect(pacienteVazio.isEmpty, isTrue);
      });
    });

    group('serialização', () {
      test('toJson e fromJson devem fazer a conversão corretamente.', () {
        var json = contato.toJson();

        expect(json, allOf([isNotNull, isA<Map<String, dynamic>>()]));
        expect(Contato.fromJson(json), equals(contato));
        expect(json['uid'],
            allOf([isNotNull, isA<String>(), equals(contato.uid)]));
        expect(json['criadoEm'], allOf([isNotNull, isA<String>()]));
        expect(json['atualizadoEm'], allOf([isNotNull, isA<String>()]));
        expect(json['nome'],
            allOf([isA<String>(), isNotNull, equals(contato.nome)]));
        expect(
            json['account'], allOf([isA<Map<String, dynamic>>(), isNotNull]));
        expect(json['categorias'], allOf([isA<Iterable<String>>(), isNotNull]));
        expect(json['categorias'].isEmpty, isFalse);
        expect(json['telefones'], allOf([isA<Iterable<String>>(), isNotNull]));
        expect(json['categorias'].isEmpty, isFalse);
        expect(json['ativo'],
            allOf([isA<bool>(), isNotNull, equals(contato.ativo)]));

        contato = genRandomContato(
          includeAccount: false,
          includeAtivo: false,
          includeAtualizadoEm: false,
          includeCriadoEm: false,
        );
        json = contato.toJson();
        expect(json['ativo'], isNull);
        expect(json['account'], isNull);
        expect(json['criadoEm'], isNull);
        expect(json['atualizadoEm'], isNull);
      });

      test('toJsonPostMethod deve possuir as propriedades corretas', () {
        var jsonPost = contato.toJsonPostMethod();

        expect(jsonPost['uid'], isNull);
        expect(jsonPost['criadoEm'], isNull);
        expect(jsonPost['atualizadoEm'], isNull);
      });

      test('toJsonPutMethod deve possuir as propriedades corretas.', () {
        var jsonPut = contato.toJsonPutMethod();

        expect(jsonPut['account'], isNull);
      });

      test('fromJsonList deve fazer a conversão correta.', () {
        const lenght = 4;
        final contatosJson =
            List.generate(lenght, (_) => genRandomContato().toJson());
        final responseObject = {'dados': contatosJson};
        expect(Contato.fromJsonList(responseObject),
            allOf([isA<List<Contato>>(), hasLength(lenght)]));
      });

      test('fromJsonList não deve passar no assert ao informar valor inválido.',
          () {
        final objeto = {'dados': 'objetoInválido'};
        expect(() => Contato.fromJsonList(objeto), throwsAssertionError);
      });
    });

    group('getter isEmpty', () {
      test('deve retornar falso com objeto populado.', () {
        expect(contato.isEmpty, isFalse);
      });
    });

    group('roles e hierarquia', () {
      test(
          'objeto com categorias \'dentista\' e \'colaborador\' deve ser Dentista de Espaço Odontológico e vice-versa.',
          () {
        contato = contato.copyWith(categorias: {Roles.fornecedor});
        expect(contato.isDentistaEspacoOdontologico, isFalse);
        contato =
            contato.copyWith(categorias: {Roles.colaborador, Roles.dentista});
        expect(contato.isDentistaEspacoOdontologico, isTrue);
      });

      test('objeto deve possuir hierarquias correspondentes ao index do enum',
          () {
        contato = contato.copyWith(categorias: {Roles.admin, Roles.paciente});
        expect(contato.hierarquia, equals(0));
        expect(contato.maiorRole, equals(Roles.admin));

        contato = contato.copyWith(categorias: {Roles.fornecedor});
        expect(contato.hierarquia, equals(Roles.fornecedor.index));

        contato =
            contato.copyWith(categorias: {Roles.gerente, Roles.colaborador});
        expect(contato.hierarquia, equals(Roles.gerente.index));
        expect(contato.maiorRole, equals(Roles.gerente));
        expect(contato.isA(Roles.gerente), isTrue);
      });

      test(
          'comparações de hierarquia entre objetos deve retornar true ou false corretamente',
          () {
        final contatoPraComparar =
            contato.copyWith(categorias: {Roles.gerente, Roles.colaborador});
        contato =
            contato.copyWith(categorias: {Roles.dentista, Roles.colaborador});

        expect(
          contatoPraComparar.temHierarquiaMaiorOuIgualQue(contato.maiorRole),
          isTrue,
        );
        expect(
          contatoPraComparar.temHierarquiaMaiorQue(contato.maiorRole),
          isTrue,
        );
        expect(
          contatoPraComparar.temHierarquiaMenorOuIgualQue(contato.maiorRole),
          isFalse,
        );
        expect(
          contatoPraComparar.temHierarquiaMenorQue(contato.maiorRole),
          isFalse,
        );
      });
    });
  });
}
