import 'package:laboratorio_ferreira_mobile/src/core/data/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';

class SettingsRepository {
  SettingsRepository();

  Future<void> init() async {}

  late Setting _value;

  Setting get value => _value;

  Future<void> resetSession([Session? session]) async {
    // await _isar.settings
    //     .put(_value.copyWith(session: session), replaceOnConflict: true);
  }
}
