import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/notifiers/auth_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_repository_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/local_token_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/token_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/user_session_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final auth = ref.read(authRepositoryProvider);
  final localToken = ref.read(localTokenServiceProvider);
  final tokenNotifier = ref.watch(tokenNotifierProvider.notifier);
  final userSession = ref.read(userSessionServiceProvider);

  return AuthNotifier(
    authRepository: auth,
    localTokenService: localToken,
    tokenNotifier: tokenNotifier,
    userSessionService: userSession,
  );
});
