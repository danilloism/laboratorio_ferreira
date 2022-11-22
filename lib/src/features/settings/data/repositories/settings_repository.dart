import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

abstract class SettingsRepository {
  Future<Setting> upsertSetting(SettingsItem setting, dynamic value);

  Future<bool> deleteSetting(SettingsItem setting);

  Future<Map<String, Object?>?> get(SettingsItem setting);

  Setting get activeStored;

  Future<void> init();
}

final settingsRepositoryProvider =
    Provider<SettingsRepository>((ref) => throw UnimplementedError());
