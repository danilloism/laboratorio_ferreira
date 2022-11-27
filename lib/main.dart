import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/application/services/services.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';

import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:sembast/sembast.dart';

final databaseProvider =
    Provider<Database>((ref) => throw UnimplementedError());

Future<void> main() async {
  final initContainer = await Init.container;

  runApp(
    UncontrolledProviderScope(
      container: initContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'Laboratório Ferreira',
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ref
          .watch(settingsControllerProvider.select((value) => value.themeMode)),
      routerConfig: ref.read(routerProvider),
    );
  }
}
