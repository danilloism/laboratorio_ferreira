import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:sembast/sembast.dart';

extension ThemeModeToSembast on ThemeMode {
  Map<String, Object> toSembast() {
    return {'value': index};
  }
}

extension SessionToSembast on Session? {
  Map<String, Object?> toSembast() {
    if (this == null) return {'value': null};

    return {'value': this!.toJson()};
  }
}

enum SettingsItem { session, themeMode }

Session? _sessionFromSembast(Map<String, Object?>? object) {
  if (object == null || object['value'] == null) return null;

  return Session.fromJson(object['value']);
}

ThemeMode? _themeModeFromSembast(Map<String, Object?>? object) {
  if (object == null) return null;

  return ThemeMode.values[object['value'] as int];
}

class SettingsSembastRepository with UiLoggy implements SettingsRepository {
  final Database _database;
  final _store = stringMapStoreFactory.store('settings_store');
  late Setting _current;

  SettingsSembastRepository(this._database);

  @override
  Future<void> init() async {
    await _database.transaction((txn) async {
      final sessionObject =
          await _store.record(SettingsItem.session.name).get(txn);
      final themeModeObject =
          await _store.record(SettingsItem.themeMode.name).get(txn);
      final session = _sessionFromSembast(sessionObject);
      final themeMode = _themeModeFromSembast(themeModeObject);

      _current = Setting(themeMode: themeMode ?? ThemeMode.system);

      if (session?.accessToken != null &&
          !JwtDecoder.isExpired(session!.accessToken)) {
        _current = _current.copyWith(session: session);
      }
    });
  }

  @override
  Setting get activeStored => _current;

  @override
  Future<bool> deleteSetting(SettingsItem settingName) async {
    final setting = await _store.record(settingName.name).delete(_database);
    return setting != null;
  }

  @override
  Future<Setting> upsertSetting(SettingsItem setting, dynamic value) async {
    return await _database.transaction((txn) async {
      switch (setting) {
        case SettingsItem.themeMode:
          if (value is! ThemeMode) throw TypeError();
          await _store
              .record(setting.name)
              .put(txn, value.toSembast(), merge: true);
          _current = _current.copyWith(themeMode: value);
          return _current;
        case SettingsItem.session:
          if (value is! Session?) throw TypeError();
          await _store.record(setting.name).put(txn, value.toSembast());
          _current = _current.copyWith(session: value);
          return _current;
      }
    });
  }

  @override
  Future<Map<String, Object?>?> get<T>(SettingsItem setting) async {
    final record = await _store.record(setting.name).get(_database);
    return record;
  }
}
