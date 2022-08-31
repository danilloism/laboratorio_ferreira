import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/database.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/helpers/model_converters.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

part '../../../../../generated/src/core/data/database/daos/settings_dao.g.dart';

@DriftAccessor(include: {'../sql/tabelas.drift', '../sql/triggers.drift'})
class SettingsDao extends DatabaseAccessor<Database> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<List<SettingTable>> getAll() => select(settings).get();
  Future<Setting?> findActiveSettings() async {
    final query = select(settings).join([
      innerJoin(sessions,
          sessions.accessToken.equalsExp(settings.sessionAccessToken)),
      innerJoin(contatos, contatos.uid.equalsExp(sessions.contatoUid)),
      innerJoin(accounts, accounts.contatoUid.equalsExp(contatos.uid)),
    ])
      ..where(settings.active.equalsValue(true));

    return query.map((row) {
      final session = row.readTable(sessions);
      final setting = row.readTable(settings);
      final contato = row.readTable(contatos);
      final account = row.readTable(accounts);

      return FromSqlConverter.setting(
        setting,
        sessionTable: session,
        contatoTable: contato,
        accountTable: account,
      );
    }).getSingleOrNull();
  }

  Future<Setting> create(Setting value) async {
    return await transaction(() async {
      if (value.session == null) {
        // await sessions.insertOne(SessionTable(
        //     accessToken: accessToken, contatoUid: contatoUid, active: active));
        final settingsRow =
            ToSqlConverter.setting(Setting(themeMode: value.themeMode));

        await into(settings)
            .insert(settingsRow, mode: InsertMode.insertOrReplace);
        final query = select(settings)
          ..where((tbl) => tbl.themeMode.equalsValue(value.themeMode))
          ..where((tbl) => tbl.sessionAccessToken.isNull());

        return await query
            .map((row) => FromSqlConverter.setting(row))
            .getSingle();
      }

      final sessionRow = ToSqlConverter.session(value.session!);
      final contatoRow = ToSqlConverter.contato(value.session!.contato);
      final accountRow =
          ToSqlConverter.account(value.session!.contato.account!);
      final settingRow = ToSqlConverter.setting(value);

      await Future.wait([
        into(contatos).insert(contatoRow),
        into(accounts).insert(accountRow),
        into(sessions).insert(sessionRow),
        into(settings).insert(settingRow),
      ]);

      final query = select(settings).join([
        innerJoin(sessions,
            sessions.accessToken.equalsExp(settings.sessionAccessToken)),
        innerJoin(contatos, contatos.uid.equalsExp(sessions.contatoUid)),
        innerJoin(accounts, accounts.contatoUid.equalsExp(contatos.uid))
      ])
        ..where(settings.sessionAccessToken.equals(value.session!.accessToken));

      return await query.map((row) {
        final session = row.readTable(sessions);
        final setting = row.readTable(settings);
        final contato = row.readTable(contatos);
        final account = row.readTable(accounts);

        return FromSqlConverter.setting(
          setting,
          accountTable: account,
          contatoTable: contato,
          sessionTable: session,
        );
      }).getSingle();
    });
  }
}
