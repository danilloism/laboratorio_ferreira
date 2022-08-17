import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/i_local_storage_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item_model.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/secure_storage_service.dart';

class DefaultStorageService implements ILocalStorageService {
  final _hiveEncryptedBoxName = 'HiveEncrypted';
  final Box _box;
  final SecureStorageService _secureStorage;

  DefaultStorageService({
    required SecureStorageService secureStorage,
    required Box hiveBox,
  })  : _secureStorage = secureStorage,
        _box = hiveBox;

  @override
  Future<String?> get(String key) => _box.get(key);

  @override
  Future<void> save(LocalStorageItem item) async => _box.put(
        item.key,
        item.value,
      );

  Future<List<int>> get _hiveSecureKey async {
    const itemKey = 'hiveSecurityKey';

    var hiveKey = await _secureStorage.get(itemKey);

    if (hiveKey != null) return base64Url.decode(hiveKey);

    final hiveGeneratedKey = Hive.generateSecureKey();
    hiveKey = base64UrlEncode(hiveGeneratedKey);
    _secureStorage.save(LocalStorageItem(itemKey, hiveKey));
    return hiveGeneratedKey;
  }

  Future<void> saveEncrypted<T>(LocalStorageItem<T> item) async {
    final encryptedBox = await Hive.openBox(_hiveEncryptedBoxName,
        encryptionCipher: HiveAesCipher(await _hiveSecureKey));

    await encryptedBox.put(item.key, item.value);
    await encryptedBox.close();
  }

  Future getEncrypted(String key) async {
    final secureKey = Hive.generateSecureKey();
    final encryptedBox = await Hive.openBox(_hiveEncryptedBoxName,
        encryptionCipher: HiveAesCipher(secureKey));

    final value = encryptedBox.get(key);
    await encryptedBox.close();
    return value;
  }
}
