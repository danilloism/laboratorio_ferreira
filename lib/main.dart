import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/navigation_index_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/settings_event.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context
          .select<SettingsBloc, ThemeMode>((value) => value.state.themeMode),
      home: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (_, current) {
          return current.maybeWhen(
            loggedIn: (session) {
              return session != SettingsBloc.of(context).state.session;
            },
            loggedOut: () {
              return SettingsBloc.of(context).state.session != null;
            },
            error: (_, __) => true,
            orElse: () => false,
          );
        },
        listener: (ctx, state) {
          state.whenOrNull(
            loggedIn: (session) => SettingsBloc.of(ctx).add(
              SettingsEvent.activeSettingChanged(Setting(session: session)),
            ),
            loggedOut: () => SettingsBloc.of(ctx)
                .add(const SettingsEvent.activeSettingChanged(Setting())),
            error: (error, _) => ctx.showErrorSnackBar(message: error),
          );
        },
        buildWhen: (_, current) => current.maybeWhen(
          loggedIn: (_) => true,
          loggedOut: () => true,
          orElse: () => false,
        ),
        builder: (_, state) => state.when(
          loggedIn: (_) => BlocProvider(
            create: (_) => NavigationIndexCubit(),
            child: const HomePage(),
          ),
          loggedOut: () => const LoginPage(),
          loggingIn: () => const LoginPage(),
          error: (_, __) => const Scaffold(),
          unknown: () => const WelcomePage(),
        ),
      ),
    );
  }
}
