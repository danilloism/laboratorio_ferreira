import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/firebase_options.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/bloc/bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/data/data.dart';
import 'package:sembast/sembast.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/presentation.dart';

final databaseProvider =
    Provider<Database>((ref) => throw UnimplementedError());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final chamadasAssincronas = await Future.wait([
    Init.database(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
  Init.executeAfterAsyncCall();

  final db = chamadasAssincronas[0] as Database;
  final settingsRepo = await Init.settingsRepo(db);

  runApp(ProviderScope(
    overrides: [
      settingsRepositoryProvider.overrideWithValue(settingsRepo),
      databaseProvider.overrideWithValue(db),
    ],
    observers: [RiverpodLogger()],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(authNotifierProvider.notifier).init();
    ref.read(networkStatusProvider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      final session = ref.read(settingsProvider).session;
      if (next is LoggedIn && session != next.session) {
        ref.read(settingsProvider.notifier).changeSession(next.session);
      }

      if (next is LoggedOut && session != null) {
        ref.read(settingsProvider.notifier).changeSession();
      }
    });
    return MaterialApp.router(
      title: 'Laboratório Ferreira',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(settingsProvider.select((value) => value.themeMode)),
      routerConfig: ref.read(routerProvider),
    );
  }
}
