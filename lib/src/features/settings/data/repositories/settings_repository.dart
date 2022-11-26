import 'package:laboratorio_ferreira_mobile/main.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/settings/data/repositories/settings_repository.g.dart';

abstract class SettingsRepository {
  Future<Setting> upsertSetting(SettingsItem setting, dynamic value);

  Future<bool> deleteSetting(SettingsItem setting);

  Future<Map<String, Object?>?> get(SettingsItem setting);

  Setting get activeStored;

  Future<void> init();
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(SettingsRepositoryRef ref) =>
    SettingsSembastRepository(ref.watch(databaseProvider));
