// coverage:ignore-file
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/env.dart';
import 'package:laboratorio_ferreira_mobile/firebase_options.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/services.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/controllers/controllers.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:loggy/loggy.dart';

class Init {
  const Init._();

  static Future<ProviderContainer> get container async {
    _initLoggy();
    WidgetsFlutterBinding.ensureInitialized();

    final container = ProviderContainer(observers: [RiverpodLogger()]);

    print(DefaultFirebaseOptions.currentPlatform.projectId);
    print(kReleaseMode);

    await Future.wait([
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      Init._initDatabase(),
    ]);

    _initPostAsyncCalls();
    _initListeners(container);
    _tryRefreshToken(container);

    return container;
  }

  static void _initLoggy() {
    Loggy.initLoggy(
      logPrinter: kReleaseMode
          ? const DefaultPrinter()
          : const PrettyDeveloperPrinter(),
      logOptions: kReleaseMode
          ? const LogOptions(LogLevel.error)
          : const LogOptions(
              LogLevel.all,
              includeCallerInfo: true,
              stackTraceLevel: LogLevel.warning,
            ),
    );
  }

  static void _tryRefreshToken(ProviderContainer container) {
    // Inicializar Network Status Provider
    container.read(networkStatusProvider);

    // Refresh Token //
    final settingsNotifier = container.read(settingsControllerProvider);
    final session = settingsNotifier.session;
    if (session != null) {
      final tokenUsuarioLogado = session.accessToken;

      if (JwtDecoder.isExpired(tokenUsuarioLogado)) return;

      final decodedToken = JwtDecoder.decode(tokenUsuarioLogado);
      final iat = DateTime.fromMillisecondsSinceEpoch(0)
          .add(Duration(seconds: decodedToken['iat']));
      final dataAtual = DateTime.now();
      final diferencaDias = dataAtual.difference(iat).inDays;
      if (diferencaDias <= 2) return;
      container
          .read(authRepositoryProvider)
          .refreshToken()
          .then((refreshToken) {
        final currentAuthState = container.read(authControllerProvider);
        if (currentAuthState is! LoggedIn) return;
        final newSession =
            session.copyWith(accessToken: refreshToken.accessToken);
          container
              .read(settingsControllerProvider.notifier)
              .changeSession(newSession);
        });
      }
    }
  }

  static void _initListeners(ProviderContainer container) {
    container.listen<AuthState>(authControllerProvider, (previous, next) {
      final settingsNotifier =
          container.read(settingsControllerProvider.notifier);
      final session = container.read(settingsControllerProvider).session;
      if (next is LoggedIn && session != next.session) {
        settingsNotifier.changeSession(next.session);
      }

      if (next is LoggedOut && session != null) {
        settingsNotifier.changeSession();
      }
    });
  }

  static void _initPostAsyncCalls() {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
  }

  static Future<void> _initDatabase() async {
    await Hive.initFlutter();
    await Hive.openBox(Env.localDbSettingsBoxName);
  }
}
