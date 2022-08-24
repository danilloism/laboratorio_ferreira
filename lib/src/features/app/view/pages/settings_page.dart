import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/router_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref
        .watch(authNotifierProvider.notifier.select((value) => value.session));
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Configurações')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Olá, ${session?.contato.nome.split(' ')[0]}',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(routerServiceProvider)
                        .router
                        .push('${Routes.detalhesContato.fullPath}/me'),
                    child: const Text('Ver meu contato'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Editar conta'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).logout(),
                child: const Text('Sair'))
          ],
        ),
      ),
    );
  }
}
