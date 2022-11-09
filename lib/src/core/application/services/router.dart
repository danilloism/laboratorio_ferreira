import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/view/pages/login_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/pages/detalhes_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/pages/editor_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/view/pages/lista_contatos_page_view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/pages/pages.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouterRefreshListenable(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: !Constants.isProduction,
    refreshListenable: router,
    initialLocation: '/splash',
    redirect: router._redirect,
    routes: router._routes,
  );
});

class GoRouterRefreshListenable extends ChangeNotifier {
  final Ref _ref;

  GoRouterRefreshListenable(this._ref) {
    _ref.listen<AuthState>(authNotifierProvider, (_, __) => notifyListeners());
  }

  List<RouteBase> get _routes => [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (_, __, child) => HomePage(child: child),
          routes: [
            GoRoute(
              name: 'inicio',
              path: '/inicio',
              builder: (context, state) => const InicioPageView(),
            ),
            GoRoute(
              name: 'contatos',
              path: '/contatos',
              builder: (context, state) => const ContatosPageView(),
            ),
            GoRoute(
              name: 'servicos',
              path: '/servicos',
              builder: (context, state) => const ServicosPageView(),
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: 'acaoContato',
          path: '/contatos/:uid/:acao',
          builder: (context, state) {
            final acao = state.params['acao'];

            final me = _ref.read(settingsNotifierProvider).session!.contato;

            if (acao == 'info') {
              return DetalhesContatoPage(me);
            }

            return EditorContatoPage(contato: me);
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: 'criarContato',
          path: '/contatos/criar',
          builder: (context, state) => EditorContatoPage(),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: 'splash',
          path: '/splash',
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: 'settings',
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              name: 'settingsEditarContato',
              path: 'editar_contato',
              redirect: (context, _) {
                if (_ref.read(authNotifierProvider) is LoggedIn) {
                  return '/contatos/me/editar';
                }

                return null;
              },
            ),
          ],
        ),
      ];

  String? _redirect(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authNotifierProvider);

    switch (state.location) {
      case '/splash':
        return authState.whenOrNull(
          loggedIn: (_) => '/inicio',
          loggedOut: () => '/login',
        );

      case '/inicio':
      case '/contatos':
      case '/servicos':
        return authState.whenOrNull(loggedOut: () => '/login');

      case '/login':
        return authState.whenOrNull(loggedIn: (_) => '/inicio');

      default:
        return null;
    }
  }
}
