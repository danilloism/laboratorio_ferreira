import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/repositories/settings_hive_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../generated/src/features/settings/data/repositories/settings_repository.g.dart';

abstract class SettingsRepository {
  Setting get current;
  ThemeMode get themeMode;
  bool get useMaterial3;
  Session? get session;

  Future<Session?> setSession(Session? session);

  Future<ThemeMode> setThemeMode(ThemeMode themeMode);

  Future<bool> setUseMaterial3(bool value);
}

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) =>
    const SettingsHiveRepository();
