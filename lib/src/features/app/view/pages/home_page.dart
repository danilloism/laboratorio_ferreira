import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/router_service_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => ref
                  .read(routerServiceProvider)
                  .router
                  .push(Routes.settings.fullPath),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const SafeArea(
        child: SizedBox.expand(),
      ),
    );
  }
}
