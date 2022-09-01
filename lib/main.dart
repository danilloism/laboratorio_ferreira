import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_event.dart';
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
            localSession:
                GetIt.I.get<SettingsRepository>().activeStored.session,
          )..add(const AuthEvent.appInitialized()),
        ),
        BlocProvider(create: (_) => SettingsBloc(settingsRepo: GetIt.I.get()))
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IHttpService>(
              create: (_) => GetIt.I.get<IHttpService>()),
          RepositoryProvider<Database>(create: (_) => GetIt.I.get<Database>()),
          RepositoryProvider<SettingsRepository>(
              create: (_) => GetIt.I.get<SettingsRepository>()),
          RepositoryProvider<AuthRepository>(
              create: (_) => GetIt.I.get<AuthRepository>()),
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
      home: BlocListener<AuthBloc, AuthState>(
        listenWhen: (_, current) => current.maybeWhen(
          loggedIn: (session) =>
              session != context.read<SettingsBloc>().state.session,
          loggedOut: () => context.read<SettingsBloc>().state.session != null,
          orElse: () => false,
        ),
        listener: (ctx, state) {
          state.whenOrNull(
            loggedIn: (session) => ctx.read<SettingsBloc>().add(
                SettingsEvent.activeSettingChanged(Setting(session: session))),
            loggedOut: () => ctx
                .read<SettingsBloc>()
                .add(const SettingsEvent.activeSettingChanged(Setting())),
          );
        },
        child: context.watch<AuthBloc>().state.when(
            loggedIn: (_) => const HomePage(),
            loggedOut: () => const LoginPage(),
            loggingIn: () => const LoginPage(),
            error: (_, __) => const Scaffold(),
            unknown: () => const WelcomePage()),
      ),
    );
  }
}
