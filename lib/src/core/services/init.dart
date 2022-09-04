import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/firebase_options.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/repositories/settings_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/repositories/settings_sembast_repository.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Init {
  const Init._();

  static Future<void> execute() async {
    Bloc.observer = AppObserver();
    Loggy.initLoggy(
      logPrinter: Config.isProduction
          ? const DefaultPrinter()
          : const PrettyDeveloperPrinter(),
      logOptions: Config.isProduction
          ? const LogOptions(LogLevel.error)
          : const LogOptions(
              LogLevel.all,
              includeCallerInfo: true,
              stackTraceLevel: LogLevel.warning,
            ),
    );

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
    await _initSembast();
    await _initRepositories();
    _registerServices();
  }

  static Future<void> _initSembast() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'lab_ferreira_sembast.db');
    final db = await databaseFactoryIo.openDatabase(dbPath);
    GetIt.I.registerLazySingleton<Database>(() => db);
  }

  static Future<void> _initRepositories() async {
    final settingsRepo = SettingsSembastRepository(GetIt.I.get());
    await settingsRepo.init();
    GetIt.I.registerLazySingleton<SettingsRepository>(() => settingsRepo);
  }

  static void _registerServices() {
    GetIt.I.registerFactory<IHttpService>(() => DioService());
    GetIt.I.registerFactory(() => AuthRepository(httpService: GetIt.I.get()));
  }
}
