import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/environment.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/pagination_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/states/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/presentation/view/pages/login_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/contatos_list/view/widgets/contatos_list.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/detalhes_contato/view/pages/detalhes_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/presentation/components/editor_contato/view/pages/editor_contato_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/presentation/view/pages/pages.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouterRefreshListenable(ref);

  return GoRouter(
    debugLogDiagnostics: !Environment.isProduction,
    refreshListenable: router,
    initialLocation: '/splash',
    redirect: router._redirect,
    routes: router._routes,
  );
});

class GoRouterRefreshListenable extends ChangeNotifier {
  final Ref _ref;

  GoRouterRefreshListenable(this._ref) {
    _ref.listen<AuthState>(
        authControllerProvider, (_, __) => notifyListeners());
  }

  List<RouteBase> get _routes => [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: 'viewcontato',
              path: 'contatos/view/:id',
              builder: (context, state) {
                final me =
                    _ref.read(settingsControllerProvider).session!.contato;

                final param = state.params['id'];
                if (param == 'me' || param == me.uid) {
                  return DetalhesContatoPage(me);
                }

                final contato = (_ref.read(contatosFetchProvider)
                        as PaginationData<Contato>)
                    .items
                    .singleWhere((element) => element.uid == param);
                return DetalhesContatoPage(contato);
              },
            ),
            GoRoute(
              name: 'editcontato',
              path: 'contatos/edit/:id',
              builder: (context, state) {
                final me =
                    _ref.read(settingsControllerProvider).session!.contato;
                final param = state.params['id'];
                if (param == 'me' || param == me.uid) {
                  return EditorContatoPage(contato: me);
                }

                final contato = (_ref.read(contatosFetchProvider)
                        as PaginationData<Contato>)
                    .items
                    .singleWhere((element) => element.uid == param);

                return EditorContatoPage(contato: contato);
              },
            ),
            GoRoute(
              name: 'createcontato',
              path: 'contatos/create',
              builder: (context, state) => EditorContatoPage(),
            ),
          ],
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
          name: 'settings',
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              name: 'settingsEditarContato',
              path: 'editar_contato',
              redirect: (context, _) {
                if (_ref.read(authControllerProvider) is LoggedIn) {
                  return '/contatos/edit/me';
                }

                return null;
              },
            ),
          ],
        ),
      ];

  String? _redirect(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authControllerProvider);

    switch (state.location) {
      case '/splash':
        return authState.whenOrNull(
          loggedIn: (_) => '/',
          loggedOut: () => '/login',
        );

      case '/':
        return authState.whenOrNull(loggedOut: () => '/login');

      case '/login':
        return authState.whenOrNull(loggedIn: (_) => '/');

      default:
        return null;
    }
  }
}
