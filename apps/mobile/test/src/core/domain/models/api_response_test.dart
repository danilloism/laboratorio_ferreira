import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

import '../../../../helpers/random_model_generators.dart';

main() {
  late ApiResponse response;
  late Map<String, Object?> json;

  setUp(() {
    json = {};
  });

  group('Objeto', () {
    group('serialização/desserialização', () {
      group('fromJson', () {
        group('com apenas uma entidade', () {
          test('deve fazer conversão', () {
            final contato = genRandomContato();

            json['sucesso'] = true;
            json['dados'] = contato.toJson();

            response = ApiResponse<Contato>.fromJson(json, Contato.fromJson);

            expect(response, isA<ApiResponse<Contato>>());
            expect(response.sucesso, isTrue);
            expect(response.dados, isNotNull);
            expect(response.erro, isNull);
            expect(response.mensagem, isNull);
            expect(response.dados, equals(contato));
          });

          test('deve fazer conversão com \'dados\' nulo e mensagem de erro',
              () {
            json['sucesso'] = false;
            json['mensagem'] = 'ops';
            json['erro'] = 'ops';
            final response =
                ApiResponse<Contato>.fromJson(json, Contato.fromJson);

            expect(response, isA<ApiResponse<Contato>>());
            expect(response.sucesso, isFalse);
            expect(response.dados, isNull);
            expect(response.erro, isNotNull);
            expect(response.mensagem, isNotNull);
          });
        });

        group('com lista de entidades', () {
          test('deve fazer conversão', () {
            const length = 5;
            final contatos =
                List.generate(length, (index) => genRandomContato());
            json['sucesso'] = true;
            json['dados'] = contatos.map((e) => e.toJson()).toList();

            final response =
                ApiResponse<List<Contato>>.fromJson(json, Contato.fromJsonList);

            expect(response, isA<ApiResponse<List<Contato>>>());
            expect(response.dados, isNotNull);
            expect(response.dados, isA<List<Contato>>());
            expect(response.dados, hasLength(length));
            expect(response.dados?[0], equals(contatos[0]));
            expect(response.dados?.last, equals(contatos.last));
          });
        });
      });
    });
  });
}
