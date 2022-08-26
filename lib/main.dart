import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/bloc/app_bloc_observer.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/data/repositories/settings_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/theme/app_theme.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/repositories/api_auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/repository/contato_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/services/dio_service.dart';
import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  Loggy.initLoggy(
    logPrinter: Config.isProduction
        ? const DefaultPrinter()
        : const PrettyDeveloperPrinter(),
    logOptions: LogOptions(
      Config.isProduction ? LogLevel.error : LogLevel.all,
      includeCallerInfo: true,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(lazy: true, create: (_) => DioService()),
          RepositoryProvider(create: (_) => AppSettingsRepository()),
        ],
        child: const MyApp(),
      ),
    ),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            lazy: true,
            create: (context) =>
                ContatoRepository(httpService: context.read<DioService>())),
        RepositoryProvider(
            lazy: true,
            create: (context) =>
                ApiAuthRepository(dioService: context.read<DioService>())),
      ],
      child: MaterialApp(
        title: 'Laboratório Ferreira',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppSettingsRepository>().state?.themeMode,
      ),
    );
  }
}
