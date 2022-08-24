import 'dart:async';

import 'package:laboratorio_ferreira_mobile/src/features/auth/constants/auth_constants.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/local_storage_service.dart';

class LocalTokenService {
  final LocalStorageService _storage;

  LocalTokenService({required LocalStorageService storage})
      : _storage = storage;

  Future<String?> get token async {
    final value =
        await _storage.getEncrypted(AuthConstants.tokenSecStorageKeyName);

    return value;
  }

  Future<void> reset(String? token) async {
    try {
      await _storage.deleteEncrypted(AuthConstants.tokenSecStorageKeyName);

      if (token != null) {
        await _storage.saveEncrypted(
            LocalStorageItem(AuthConstants.tokenSecStorageKeyName, token));
      }
    } catch (_) {
      rethrow;
    }
  }
}
