// coverage:ignore-file
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/environment.dart';
import 'package:laboratorio_ferreira_mobile/firebase_options.dart';
import 'package:laboratorio_ferreira_mobile/main.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/services.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/controllers/controllers.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class Init {
  const Init._();

  static Future<ProviderContainer> get container async {
    WidgetsFlutterBinding.ensureInitialized();
    _initLoggy();

    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWith((ref) => throw UnimplementedError())
      ],
      observers: [RiverpodLogger()],
    );

    await Future.wait([
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      Init._initDatabase(container),
    ]);

    await _initSettingsRepo(container);
    _initPostAsyncCalls();
    _initListeners(container);
    _tryRefreshToken(container);

    return container;
  }

  static void _initLoggy() {
    Loggy.initLoggy(
      logPrinter: Environment.isProduction
          ? const DefaultPrinter()
          : const PrettyDeveloperPrinter(),
      logOptions: Environment.isProduction
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
      // container.read(contatosControllerProvider.notifier).loadContatos();

      final tokenUsuarioLogado = session.accessToken;
      final decodedToken = JwtDecoder.decode(tokenUsuarioLogado);
      final iat = DateTime.fromMillisecondsSinceEpoch(0)
          .add(Duration(seconds: decodedToken['iat']));
      final dataAtual = DateTime.now();
      final diferencaDias = iat.day - dataAtual.day;
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

  static void _initListeners(ProviderContainer container) {
    container.listen<AuthState>(authControllerProvider, (previous, next) {
      final settingsNotifier = container.read(settingsControllerProvider);
      final session = settingsNotifier.session;
      if (next is LoggedIn && session != next.session) {
        container
            .read(settingsControllerProvider.notifier)
            .changeSession(next.session);
      }

      if (next is LoggedOut && session != null) {
        container.read(settingsControllerProvider.notifier).changeSession();
      }
    });
  }

  static void _initPostAsyncCalls() {
    if (Environment.isProduction) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
  }

  static Future<void> _initDatabase(ProviderContainer container) async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'lab_ferreira_sembast.db');

    final db = await databaseFactoryIo.openDatabase(dbPath);

    container.updateOverrides([databaseProvider.overrideWith((ref) => db)]);
  }

  static Future<void> _initSettingsRepo(ProviderContainer container) async {
    final settingsRepo = container.read(settingsRepositoryProvider);
    return await settingsRepo.init();
  }
}
