import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:laboratorio_ferreira_mobile/src/core/misc/extensions/extensions.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/domain/models/setting.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/widgets/logged_in_info_section.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/widgets/theme_dropdowns.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioLogado = ref.watch(usuarioLogadoProvider);
    ref.listen<Setting>(settingsControllerProvider, (previous, next) {
      if (GoRouter.of(context).location == '/settings') {
        if (previous?.session != next.session) context.pop();
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
                      if (usuarioLogado != null) const LoggedInInfoSection(),
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
                      if (usuarioLogado == null ||
                          !usuarioLogado
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
            if (usuarioLogado != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 4),
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).logout();
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
