import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:loggy/loggy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: Config.isProduction
        ? const DefaultPrinter()
        : const PrettyDeveloperPrinter(),
    logOptions: Config.isProduction
        ? const LogOptions(LogLevel.error, includeCallerInfo: true)
        : const LogOptions(
            LogLevel.all,
            includeCallerInfo: true,
            stackTraceLevel: LogLevel.all,
          ),
  );

  final db = Database();
  final settingsRepo = SettingsRepository(db.settingsDao);
  await settingsRepo.init();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<IHttpService>(create: (_) => DioService()),
      RepositoryProvider<Database>.value(value: db),
      RepositoryProvider<SettingsRepository>.value(value: settingsRepo),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (ctx) =>
                AuthRepository(httpService: ctx.read<IHttpService>())),
      ],
      child: BlocProvider<AuthBloc>(
        lazy: false,
        create: (ctx) => AuthBloc(
          authRepository: ctx.read<AuthRepository>(),
          settingsRepository: ctx.read<SettingsRepository>(),
        )..add(const AuthEvent.appInitialized()),
        child: MaterialApp(
          title: 'Laboratório Ferreira',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          // themeMode: context.select<SettingsRepository, ThemeMode>(
          //     (value) => value.value.themeMode),
          home: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) => state.when(
                  loggedIn: (_) => const HomePage(),
                  loggedOut: () => const LoginPage(),
                  loggingIn: () => const LoginPage(),
                  error: (_, __) => const Scaffold(),
                  unknown: () => const WelcomePage())),
        ),
      ),
    );
  }
}
