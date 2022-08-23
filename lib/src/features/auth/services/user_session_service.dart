import 'package:laboratorio_ferreira_mobile/src/features/auth/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/constants/hive_constants.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/models/local_storage_item.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/local_storage_service.dart';

class UserSessionService {
  final LocalStorageService _localStorage;

  UserSessionService({required LocalStorageService localStorage})
      : _localStorage = localStorage;

  Session? get user => _localStorage.get<Session>(
      key: HiveBoxKeys.auth.value, boxName: HiveBoxesConstants.session.name);

  Future<bool> save(Session user) async {
    return await _localStorage.save<Session>(
        item: LocalStorageItem(HiveBoxKeys.auth.value, user),
        boxName: HiveBoxesConstants.session.name);
  }

  Future<bool> delete() async {
    return await _localStorage.delete<Session>(
        key: HiveBoxKeys.auth.value, boxName: HiveBoxesConstants.session.name);
  }
}
