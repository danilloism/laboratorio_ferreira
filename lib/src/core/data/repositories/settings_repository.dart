import 'package:laboratorio_ferreira_mobile/src/core/data/models/models.dart';

abstract class SettingsRepository {
  Future<Setting?> upsertSetting(Setting setting);

  Future<bool> deleteSetting(int settingId);

  Future<List<Setting>> getMany();

  Future<Setting?> getOne(int id);

  Setting get active;

  Future<void> init();
}
