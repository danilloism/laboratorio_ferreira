import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

abstract class SettingsRepository {
  Future<Setting> upsertSetting(Setting setting);

  Future<bool> setThemeMode(ThemeMode mode);

  Future<bool> deleteSetting(int settingId);

  Future<List<Setting>> getMany();

  Future<Setting?> getOne(int id);

  Setting get activeStored;

  Future<void> init();
}
