import 'dart:math';

import 'package:faker/faker.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

final random = Random();

Contato genRandomContato({
  bool includeAccount = true,
  bool includeCriadoEm = true,
  bool includeAtualizadoEm = true,
  bool includeAtivo = true,
  Set<Roles>? categorias,
  Set<String>? telefones,
}) {
  var rand = random.nextInt(Roles.values.length);
  var randQuantidadeTelefones = random.nextInt(5);
  while (telefones == null && randQuantidadeTelefones == 0) {
    randQuantidadeTelefones = random.nextInt(5);
  }
  return Contato(
    nome: '${faker.person.firstName()} ${faker.person.lastName()}',
    telefones: telefones ??
        Iterable.generate(
            randQuantidadeTelefones, (_) => faker.phoneNumber.us()).toSet(),
    categorias:
        categorias ?? Iterable.generate(10, (_) => Roles.values[rand]).toSet(),
    uid: faker.guid.guid(),
    criadoEm: includeCriadoEm ? faker.date.dateTime() : null,
    atualizadoEm: includeAtualizadoEm ? DateTime.now() : null,
    account: includeAccount ? genRandomAccount(includePassword: false) : null,
    ativo: includeAtivo ? true : null,
  );
}

Account genRandomAccount({
  bool includeAtualizadoEm = true,
  bool includeCriadoEm = true,
  bool includePassword = true,
}) {
  return Account(
    email: faker.internet.email(),
    senha: includePassword ? faker.internet.password() : null,
    criadoEm: includeCriadoEm ? faker.date.dateTime() : null,
    atualizadoEm: includeAtualizadoEm ? DateTime.now() : null,
  );
}
