import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/settings_bloc.dart';

Future<void> main() async {
  await Init.execute();
  runApp(const BlocDependencyInjectionContainer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
