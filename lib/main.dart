import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:sembast/sembast.dart';

Future<void> main() async {
  await Init.execute();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: GetIt.I.get(),
            settingsRepository: GetIt.I.get(),
          )..add(const AuthEvent.appInitialized()),
        ),
        BlocProvider(create: (_) => SettingsBloc(settingsRepo: GetIt.I.get()))
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IHttpService>.value(value: GetIt.I.get()),
          RepositoryProvider<Database>.value(value: GetIt.I.get()),
          RepositoryProvider<SettingsRepository>.value(value: GetIt.I.get()),
          RepositoryProvider<AuthRepository>.value(value: GetIt.I.get()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratório Ferreira',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context
          .select<SettingsBloc, ThemeMode>((value) => value.state.themeMode),
      home: context.watch<AuthBloc>().state.when(
          loggedIn: (_) => const HomePage(),
          loggedOut: () => const LoginPage(),
          loggingIn: () => const LoginPage(),
          error: (_, __) => const Scaffold(),
          unknown: () => const WelcomePage()),
    );
  }
}
