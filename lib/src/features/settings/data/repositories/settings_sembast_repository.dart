import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:sembast/sembast.dart';

class SettingsSembastRepository with UiLoggy implements SettingsRepository {
  final Database _database;
  final _store = intMapStoreFactory.store('setting_store');
  late Setting _current;

  SettingsSembastRepository(this._database);

  @override
  Future<void> init() async {
    await _database.transaction((txn) async {
      var record = await _store.findFirst(txn,
          finder: Finder(filter: Filter.equals('active', true)));
      if (record != null) {
        _current = Setting.fromJson(record.value);
        return;
      }

      await _deactivateAll(txn);
      final result = await _addSemId(const Setting(), transaction: txn);
      _current = Setting.fromJson(result);
      return;
    });
  }

  @override
  Setting get activeStored => _current;

  @override
  Future<bool> deleteSetting(int settingId) async {
    final id = await _store.record(settingId).delete(_database);
    return id != null;
  }

  Future<void> _deactivateAll(Transaction txn) async {
    await _store.update(
      txn,
      {'active': false},
      finder: Finder(filter: Filter.equals('active', true)),
    );
  }

  @override
  Future<List<Setting>> getMany({Finder? finder}) async {
    final snapshots = await _store.find(_database, finder: finder);
    final result = snapshots
        .map((setting) => Setting.fromJson(setting.value))
        .toList(growable: false);
    return UnmodifiableListView(result);
  }

  Future<Map<String, Object?>> _addSemId(Setting setting,
      {required Transaction transaction}) async {
    final id = await _store.add(transaction, setting.toJson());
    final updatedSetting = await _store
        .record(id)
        .update(transaction, setting.copyWith(id: id).toJson());
    return updatedSetting!;
  }

  @override
  Future<Setting> upsertSetting(Setting setting) async {
    return await _database.transaction((txn) async {
      await _deactivateAll(txn);

      if (setting.session != null) {
        final finder = Finder(
            filter: Filter.equals(
                'session.contato.uid', setting.session!.contato.uid));
        final userSettingSnapshot = await _store.findFirst(txn, finder: finder);
        if (userSettingSnapshot != null) {
          final userSetting = Setting.fromJson(userSettingSnapshot.value);
          setting = setting.copyWith(
              id: userSetting.id, themeMode: userSetting.themeMode);
        }
      }

      if (setting.id == null) {
        final finder = Finder(filter: Filter.isNull('session'));
        final loggedOutSetting = await _store.findFirst(txn, finder: finder);
        if (loggedOutSetting != null) {
          final transformed = Setting.fromJson(loggedOutSetting.value);
          setting = setting.copyWith(
              id: transformed.id, themeMode: transformed.themeMode);
        }
      }

      if (setting.id == null) {
        final record = await _addSemId(setting, transaction: txn);
        _current = Setting.fromJson(record);
        return _current;
      }

      final record = await _store
          .record(setting.id!)
          .put(txn, setting.toJson(), merge: true);
      _current = Setting.fromJson(record);
      return _current;
    });
  }

  @override
  Future<Setting?> getOne(int id) async {
    final record = await _store.record(id).get(_database);
    return record == null ? null : Setting.fromJson(record);
  }

  Future<List<Setting>> getLoggedOutUsersSettings() async {
    final finder = Finder(filter: Filter.notNull('session'));
    final settings = await getMany(finder: finder);
    final validTokenSettings = settings
        .where((setting) => JwtDecoder.isExpired(setting.session!.accessToken));
    return UnmodifiableListView(validTokenSettings);
  }

  @override
  Future<bool> setThemeMode(ThemeMode mode) async {
    if (mode == _current.themeMode) return true;

    final updated = await _store
        .record(_current.id!)
        .update(_database, {'themeMode': mode.name});

    if (updated == null) return false;

    _current = Setting.fromJson(updated);
    return true;
  }
}
