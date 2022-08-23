import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item.dart';

class SecureStorageService {
  const SecureStorageService();

  final _storage = const FlutterSecureStorage();
  final _iOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  final _aOptions = const AndroidOptions(encryptedSharedPreferences: true);

  Future<String?> get(String key) async {
    final data =
        await _storage.read(key: key, aOptions: _aOptions, iOptions: _iOptions);

    return data;
  }

  Future<void> save(LocalStorageItem item) async {
    await _storage.write(
        key: item.key,
        value: item.value,
        aOptions: _aOptions,
        iOptions: _iOptions);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key, iOptions: _iOptions, aOptions: _aOptions);
  }
}
