import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item_model.dart';

abstract class ILocalStorageService {
  Future<String?> get(String key);
  Future<void> save(LocalStorageItem item);
}
