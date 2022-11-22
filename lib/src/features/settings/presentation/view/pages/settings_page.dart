import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/widgets/logged_in_info_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/widgets/theme_dropdowns.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contato = ref.watch(settingsNotifierProvider).session?.contato;
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (GoRouter.of(context).location == '/settings') {
        next.whenOrNull(
            loggedIn: (_) => context.go('/'),
            loggedOut: () => context.go('/login'));
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ref.read(authNotifierProvider) is LoggedIn)
                        const LoggedInInfoSection(),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tema',
                                  style: context.theme.textTheme.bodyLarge),
                              const ThemeDropdowns(),
                            ],
                          ),
                        ),
                      ),
                      if (contato == null ||
                          !contato
                              .temHierarquiaMaiorOuIgualQue(Roles.colaborador))
                        Card(
                          child: Column(
                            children: const [
                              Text('Entrar em contato:'),
                              TextField(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (ref.read(authNotifierProvider) is LoggedIn)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 4),
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).logout();
                    },
                    child: const Text('Sair'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
