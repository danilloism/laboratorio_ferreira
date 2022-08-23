import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/assets.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/providers/router_service_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authNotifierProvider.notifier).init();
    ref.listen<AuthState>(authNotifierProvider, (_, newState) {
      newState.when(
        loggedIn: (user) =>
            ref.read(routerServiceProvider).router.goNamed(Routes.home.name),
        loggedOut: () =>
            ref.read(routerServiceProvider).router.goNamed(Routes.login.name),
        error: (error, session) {},
        unknown: () {},
      );
    });
    return Scaffold(
      body: SizedBox.expand(
        child: ColoredBox(
          color: Cores.branco,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(height: 8),
                const Text('Bem vindo!'),
                const SizedBox(height: 8),
                const CircularProgressIndicator(color: Cores.verdeEscuro),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Teste'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
