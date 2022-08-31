import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:sembast/sembast.dart';

void main() {
  runApp(
    FutureBuilder(
        future: Init.execute(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocProvider(
              create: (_) => AuthBloc(
                  authRepository: GetIt.I.get(),
                  settingsRepository: GetIt.I.get())
                ..add(const AuthEvent.appInitialized()),
              child: const MyApp(),
            );
          }

          return const MaterialApp(home: WelcomePage());
        }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IHttpService>.value(value: GetIt.I.get()),
        RepositoryProvider<Database>.value(value: GetIt.I.get()),
        RepositoryProvider<SettingsRepository>.value(value: GetIt.I.get()),
        RepositoryProvider<AuthRepository>.value(value: GetIt.I.get()),
      ],
      child: MaterialApp(
          title: 'Laboratório Ferreira',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          // themeMode: context.select<SettingsRepository, ThemeMode>
          //     (value) => value.value.themeMode),
          home: context.watch<AuthBloc>().state.when(
              loggedIn: (_) => const HomePage(),
              loggedOut: () => const LoginPage(),
              loggingIn: () => const LoginPage(),
              error: (_, __) => const Scaffold(),
              unknown: () => const WelcomePage())),
    );
  }
}
