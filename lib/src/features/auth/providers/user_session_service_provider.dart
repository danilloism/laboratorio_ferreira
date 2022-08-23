import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/user_session_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/providers/local_storage_provider.dart';

final userSessionServiceProvider = Provider(
    (ref) => UserSessionService(localStorage: ref.read(localStorageProvider)));
