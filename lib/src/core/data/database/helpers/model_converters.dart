import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/models/contato.dart';

class ToSqlConverter {
  const ToSqlConverter._();

  static ContatosCompanion contato(Contato contato) {
    return ContatosCompanion.insert(
      uid: contato.uid,
      nome: contato.nome,
      ativo: Value(contato.ativo),
      atualizadoEm: Value(contato.atualizadoEm),
      criadoEm: Value(contato.criadoEm),
      categorias: contato.categorias,
      telefones: contato.telefones,
    );
  }

  static AccountsCompanion account(Account account) {
    return AccountsCompanion.insert(
      contatoUid: account.contatoUid!,
      email: account.email,
      atualizadoEm: Value(account.atualizadoEm),
      criadoEm: Value(account.criadoEm),
    );
  }

  static SessionsCompanion session(Session session) {
    return SessionsCompanion.insert(
      accessToken: session.accessToken,
      contatoUid: session.contato.uid,
    );
  }

  static SettingsCompanion setting(Setting setting) {
    return SettingsCompanion.insert(
      themeMode: Value(setting.themeMode),
      sessionAccessToken: Value(setting.session?.accessToken),
      active: Value(setting.active),
    );
  }
}

class FromSqlConverter {
  const FromSqlConverter._();

  static Contato contato(
    ContatoTable contatoTable, {
    AccountTable? accountTable,
  }) {
    return Contato(
      nome: contatoTable.nome,
      telefones: contatoTable.telefones,
      categorias: contatoTable.categorias,
      ativo: contatoTable.ativo,
      atualizadoEm: contatoTable.atualizadoEm,
      criadoEm: contatoTable.criadoEm,
      uid: contatoTable.uid,
      account: accountTable == null ? null : account(accountTable),
    );
  }

  static Account account(AccountTable table) {
    return Account(
      email: table.email,
      atualizadoEm: table.atualizadoEm,
      contatoUid: table.contatoUid,
      criadoEm: table.criadoEm,
    );
  }

  static Session session(
    SessionTable sessionTable, {
    required ContatoTable contatoTable,
    AccountTable? accountTable,
  }) {
    return Session(
        accessToken: sessionTable.accessToken,
        contato: contato(contatoTable, accountTable: accountTable));
  }

  static Setting setting(
    SettingTable settingTable, {
    SessionTable? sessionTable,
    ContatoTable? contatoTable,
    AccountTable? accountTable,
  }) {
    assert((sessionTable == null && contatoTable == null) ||
        (sessionTable != null && contatoTable != null));
    return Setting(
        themeMode: settingTable.themeMode,
        active: settingTable.active,
        session: sessionTable == null
            ? null
            : session(sessionTable, contatoTable: contatoTable!));
  }
}
