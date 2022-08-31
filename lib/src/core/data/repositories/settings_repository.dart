import 'package:laboratorio_ferreira_mobile/src/core/data/database/daos/daos.dart';
import 'package:laboratorio_ferreira_mobile/src/core/data/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';

class SettingsRepository {
  final SettingsDao _dao;
  SettingsRepository(this._dao);

  Future<void> init() async {
    final active = await _dao.findActiveSettings();
    if (active == null) {
      _value = await _dao.create(const Setting());
      return;
    }
    _value = active;
    return;
  }

  late Setting _value;

  Setting get value => _value;

  Future<void> resetSession([Session? session]) async {
    // await _isar.settings
    //     .put(_value.copyWith(session: session), replaceOnConflict: true);
  }
}
