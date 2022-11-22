import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/domain/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:sembast/sembast.dart';

extension ThemeModeToSembast on ThemeMode {
  Map<String, Object> toSembast() => {'value': index};
}

extension BoolToSembast on bool {
  Map<String, Object?> toSembast() => {'value': this};
}

extension SessionToSembast on Session? {
  Map<String, Object?> toSembast() => {'value': this?.toJson()};
}

extension ContatoToSembast on Contato {
  Map<String, Object?> toSembast() => {uid: toJson()};
}

enum SettingsItem { session, themeMode, useMaterial3 }

Session? _sessionFromSembast(Map<String, Object?>? object) {
  if (object == null || object['value'] == null) return null;

  return Session.fromJson(object['value']);
}

ThemeMode? _themeModeFromSembast(Map<String, Object?>? object) {
  if (object == null) return null;

  return ThemeMode.values[object['value'] as int];
}

bool? _m3FromSembast(Map<String, Object?>? object) {
  if (object == null) return null;

  return object['value'] as bool;
}

class SettingsSembastRepository with UiLoggy implements SettingsRepository {
  final Database _database;
  final _store = stringMapStoreFactory.store('settings_store');
  late Setting _current;

  SettingsSembastRepository(this._database);

  @override
  Future<void> init() async {
    await _database.transaction((txn) async {
      final objects = await Future.wait([
        _store.record(SettingsItem.session.name).get(txn),
        _store.record(SettingsItem.themeMode.name).get(txn),
        _store.record(SettingsItem.useMaterial3.name).get(txn)
      ]);

      final session = _sessionFromSembast(objects[0]);
      final themeMode = _themeModeFromSembast(objects[1]) ?? ThemeMode.system;
      final useMaterial3 = _m3FromSembast(objects[2]) ?? false;
      _current = Setting(
        themeMode: themeMode,
        useMaterial3: useMaterial3,
      );

      final token = session?.accessToken;
      if (token != null && !JwtDecoder.isExpired(token)) {
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
      putRecord(Map<String, Object?> value) =>
          _store.record(setting.name).put(txn, value);

      switch (setting) {
        case SettingsItem.themeMode:
          if (value is! ThemeMode) throw TypeError();
          await putRecord(value.toSembast());
          _current = _current.copyWith(themeMode: value);
          return _current;
        case SettingsItem.session:
          if (value is! Session?) throw TypeError();
          await putRecord(value.toSembast());
          _current = _current.copyWith(session: value);
          return _current;
        case SettingsItem.useMaterial3:
          if (value is! bool) throw TypeError();
          await putRecord(value.toSembast());
          _current = _current.copyWith(useMaterial3: value);
          return _current;
      }
    });
  }

  @override
  Future<Map<String, Object?>?> get(SettingsItem setting) async {
    final record = await _store.record(setting.name).get(_database);
    return record;
  }
}
