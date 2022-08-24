import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/router_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/services/logger.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/helpers/hive_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/secure_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const secService = SecureStorageService();
  await HiveHelper.initFlutter(secService: secService);

  runApp(ProviderScope(
    observers: [LoggerService()],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authNotifierProvider.notifier).init();
    final routerService = ref.read(routerServiceProvider);
    return MaterialApp.router(
      routeInformationParser: routerService.router.routeInformationParser,
      routerDelegate: routerService.router.routerDelegate,
      routeInformationProvider: routerService.router.routeInformationProvider,
      title: 'Laboratório Ferreira',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
