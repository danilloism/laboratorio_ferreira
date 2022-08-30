import 'package:drift/drift.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/database/database.dart';

part '../../../../../generated/src/core/data/database/daos/settings_dao.g.dart';

@DriftAccessor(include: {'../sql/tabelas.drift'})
class SettingsDao extends DatabaseAccessor<Database> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<List<Setting>> getAll() => select(settings).get();
  Future findActiveSettings() async {
    final query = select(settings).join([
      innerJoin(
        sessions,
        sessions.accessToken.equalsExp(settings.sessionAccessToken),
        useColumns: false,
      )
    ])
      ..where(sessions.active.equalsValue(true));

    final result = await query.getSingle();
  }
}
