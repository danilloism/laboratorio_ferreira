import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/consts.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/data.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/models.dart';

class SettingsHiveRepository implements SettingsRepository {
  const SettingsHiveRepository();

  Box get _box => Hive.box(HiveConsts.settingsBoxName);

  @override
  Setting get current {
    return Setting(
      session: session,
      themeMode: themeMode,
      useMaterial3: useMaterial3,
    );
  }

  @override
  ThemeMode get themeMode {
    final themeModeIndex = _getValue(HiveConsts.themeModeKey, defaultValue: 0);
    return ThemeMode.values[themeModeIndex];
  }

  @override
  bool get useMaterial3 =>
      _getValue(HiveConsts.useMaterial3Key, defaultValue: true);

  @override
  Session? get session {
    final hiveValue = _getValueOrNull(HiveConsts.sessionKey);

    if (hiveValue == null) return null;

    final sessionMap = Map<String, dynamic>.from(hiveValue);
    sessionMap['contato'] = Map<String, dynamic>.from(sessionMap['contato']);
    sessionMap['contato']['account'] =
        Map<String, dynamic>.from(sessionMap['contato']['account']);

    return Session.fromJson(sessionMap);
  }

  @override
  Future<Session?> setSession(Session? session) async {
    await _setValue(HiveConsts.sessionKey, session?.toJson());
    return session;
  }

  @override
  Future<ThemeMode> setThemeMode(ThemeMode themeMode) async {
    await _setValue(HiveConsts.themeModeKey, themeMode.index);
    return themeMode;
  }

  @override
  Future<bool> setUseMaterial3(bool value) async {
    await _setValue(HiveConsts.useMaterial3Key, value);
    return useMaterial3;
  }

  T _getValue<T>(Object key, {required T defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T;
  }

  T? _getValueOrNull<T>(Object key) {
    return _box.get(key) as T?;
  }

  Future<void> _setValue(String key, Object? value) async {
    return await _box.put(key, value);
  }
}
