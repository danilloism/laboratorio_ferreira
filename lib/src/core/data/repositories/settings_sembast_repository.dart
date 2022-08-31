import 'dart:async';
import 'dart:collection';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
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

      _current = await _addSemId(const Setting(), transaction: txn);
      return;
    });
  }

  @override
  Setting get active => _current;

  @override
  Future<bool> deleteSetting(int settingId) async {
    final id = await _store.record(settingId).delete(_database);
    return id != null;
  }

  @override
  Future<List<Setting>> getMany({Finder? finder}) async {
    final snapshots = await _store.find(_database, finder: finder);
    final result = snapshots
        .map((setting) => Setting.fromJson(setting.value))
        .toList(growable: false);
    return UnmodifiableListView(result);
  }

  Future<Setting> _addSemId(Setting setting,
      {required Transaction transaction}) async {
    if (setting.active) {
      await _store.update(transaction, {'active': false},
          finder: Finder(filter: Filter.equals('active', true)));
    }
    final id = await _store.add(transaction, setting.toJson());
    final record = await _store
        .record(id)
        .update(transaction, setting.copyWith(id: id).toJson());
    _current = Setting.fromJson(record!);
    return _current;
  }

  @override
  Future<Setting> upsertSetting(Setting setting) async {
    return await _database.transaction((txn) async {
      if (setting.session != null) {
        final finder = Finder(
            filter: Filter.equals(
                'session.contato.uid', setting.session!.contato.uid));
        final userSettingSnaphot = await _store.findFirst(txn, finder: finder);
        final userSetting = userSettingSnaphot != null
            ? Setting.fromJson(userSettingSnaphot.value)
            : null;
        if (userSetting != null) {
          setting = setting.copyWith(
              id: userSetting.id, themeMode: userSetting.themeMode);
        }
      }

      if (setting.id == null) {
        final result = await _addSemId(setting, transaction: txn);
        return result;
      }

      final record = await _store
          .record(setting.id!)
          .put(txn, setting.toJson(), merge: true);
      return Setting.fromJson(record);
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
}
