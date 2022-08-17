import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/i_local_storage_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item_model.dart';

class SecureStorageService implements ILocalStorageService {
  const SecureStorageService();

  final _storage = const FlutterSecureStorage();
  final _iOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  final _aOptions = const AndroidOptions(encryptedSharedPreferences: true);

  @override
  Future<String?> get(String key) {
    final data =
        _storage.read(key: key, aOptions: _aOptions, iOptions: _iOptions);

    return data;
  }

  @override
  Future<void> save(LocalStorageItem item) async {
    _storage.write(
        key: item.key,
        value: item.value,
        aOptions: _aOptions,
        iOptions: _iOptions);
  }
}
