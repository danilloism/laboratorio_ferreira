import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/notifiers/router_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/pages/home_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/pages/settings_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/pages/welcome_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/view/pages/login_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/view/pages/detalhes_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/view/pages/editor_contato_page.dart';

class RouterService {
  final Ref _ref;
  final RouterNotifier _notifier;
  RouterService({required RouterNotifier notifier, required Ref ref})
      : _notifier = notifier,
        _ref = ref;

  late final router = GoRouter(
    debugLogDiagnostics: !Config.isProduction,
    refreshListenable: _notifier,
    redirect: _notifier.getRedirectLogic,
    initialLocation: Routes.splash.relativePath,
    routes: [
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.relativePath,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: Routes.settings.name,
            path: Routes.settings.relativePath,
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            name: Routes.editorContato.name,
            path: Routes.editorContato.relativePath,
            builder: (context, state) {
              final id = state.params['id'];
              if (id != null) {
                final contatoSession =
                    _ref.read(authNotifierProvider.notifier).session?.contato;
                if (id == 'me' || id == contatoSession?.uid) {
                  return EditorContatoPage(contato: contatoSession);
                }
              }

              return EditorContatoPage();
            },
          ),
          GoRoute(
            name: Routes.detalhesContato.name,
            path: Routes.detalhesContato.relativePath,
            builder: (context, state) {
              final id = state.params['id'];

              return DetalhesContatoPage(
                  _ref.read(authNotifierProvider.notifier).session!.contato);
            },
          ),
        ],
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.relativePath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: Routes.splash.name,
        path: Routes.splash.relativePath,
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );
}
