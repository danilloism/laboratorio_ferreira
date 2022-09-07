import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/connectivity_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/core/services/router_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/settings_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/settings_event.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/repositories/settings_repository.dart';
import 'package:sembast/sembast.dart';

Future<void> main() async {
  await Init.execute();
  final connectivity = await Connectivity().checkConnectivity();
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
        BlocProvider(create: (_) => SettingsBloc(settingsRepo: GetIt.I.get())),
        BlocProvider(create: (_) => ConnectivityCubit(connectivity)),
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
          RepositoryProvider<RouterService>(
              create: (ctx) => RouterService(AuthBloc.of(ctx))),
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
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (_, current) {
        return current.maybeWhen(
          loggedIn: (session) {
            return session != SettingsBloc.of(context).state.session;
          },
          loggedOut: () {
            return SettingsBloc.of(context).state.session != null;
          },
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
        );
      },
      child: MaterialApp.router(
        title: 'Laboratório Ferreira',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: context
            .select<SettingsBloc, ThemeMode>((value) => value.state.themeMode),
        routeInformationParser:
            RouterService.of(context).router.routeInformationParser,
        routeInformationProvider:
            RouterService.of(context).router.routeInformationProvider,
        routerDelegate: RouterService.of(context).router.routerDelegate,
      ),
    );
  }
}
