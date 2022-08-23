import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/local_token_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/providers/local_storage_provider.dart';

final localTokenServiceProvider = Provider(
    (ref) => LocalTokenService(storage: ref.read(localStorageProvider)));
