import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/default_storage_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/secure_storage_service.dart';

final localStorageProvider = Provider(
  (ref) async {
    final box = await Hive.openBox(Config.hiveBoxName);

    ref.onDispose(() => box.close());

    return DefaultStorageService(
      secureStorage: ref.watch(_secureStorageProvider),
      hiveBox: box,
    );
  },
);

final _secureStorageProvider = Provider((ref) => const SecureStorageService());
