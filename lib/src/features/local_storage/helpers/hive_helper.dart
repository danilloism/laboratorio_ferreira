import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/constants/hive_constants.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/secure_storage_service.dart';

class HiveHelper {
  static Future<void> initFlutter(
      {required SecureStorageService secService}) async {
    await Hive.initFlutter();
    Hive.registerAdapter(AccountAdapter());
    Hive.registerAdapter(RolesEnumAdapter());
    Hive.registerAdapter(ContatoAdapter());
    Hive.registerAdapter(AuthModelAdapter());
    await Future.wait([
      Hive.openBox<Session>(HiveBoxesConstants.session.name),
      Hive.openBox(HiveBoxesConstants.encrypted.name,
          encryptionCipher:
              HiveAesCipher(await HiveHelper.getSecureKey(secService)))
    ]);
  }

  static Future<List<int>> getSecureKey(SecureStorageService secService) async {
    const encryptionKey = 'hiveSecurityKey';

    var hiveKey = await secService.get(encryptionKey);

    if (hiveKey != null) {
      return base64Url.decode(hiveKey);
    }

    final hiveGeneratedKey = Hive.generateSecureKey();
    hiveKey = base64UrlEncode(hiveGeneratedKey);
    secService.save(LocalStorageItem(encryptionKey, hiveKey));
    return hiveGeneratedKey;
  }
}
