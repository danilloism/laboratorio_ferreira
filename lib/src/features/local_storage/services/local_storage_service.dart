import 'dart:async';

import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/constants/hive_constants.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item.dart';

class LocalStorageService {
  final Box _encryptedBox;

  LocalStorageService()
      : _encryptedBox = Hive.box(HiveBoxesConstants.encrypted.name);

  T? get<T>({required dynamic key, required String boxName}) {
    if (Hive.isBoxOpen(boxName)) return Hive.box<T>(boxName).get(key);
    return null;
  }

  Future<bool> save<T>({
    required LocalStorageItem item,
    required String boxName,
  }) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box<T>(boxName).put(item.key, item.value);
      return true;
    }

    return false;
  }

  Future<void> saveEncrypted<T extends String?>(LocalStorageItem item) async {
    await _encryptedBox.put(item.key, item.value);
    return;
  }

  Future<String?> getEncrypted(String key) async {
    final value = _encryptedBox.get(key);
    return value;
  }

  Future<bool> delete<T>({
    required dynamic key,
    required String boxName,
  }) async {
    if (Hive.isBoxOpen(boxName)) {
      final box = Hive.box<T>(boxName);
      if (box.containsKey(key)) {
        await box.delete(key);
        return true;
      }
      return false;
    }

    return false;
  }

  Future<void> deleteEncrypted(String key) async {
    try {
      if (_encryptedBox.containsKey(key)) {
        await _encryptedBox.delete(key);
      }
    } catch (e) {
      rethrow;
    }
  }
}
