import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/presentation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class RouterService {
  final AuthBloc _authBloc;
  late final GoRouter router;

  RouterService(this._authBloc) {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: !Constants.isProduction,
      refreshListenable: GoRouterRefreshListenable(_authBloc),
      initialLocation: '/splash',
      redirect: _redirect,
      routes: [
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
            final me = SettingsBloc.of(context).state.session!.contato;

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
                if (AuthBloc.of(context).state is LoggedIn) {
                  return '/contatos/me/editar';
                }

                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  String? _redirect(BuildContext context, GoRouterState state) {
    switch (state.location) {
      case '/splash':
        return _authBloc.state.whenOrNull(
          loggedIn: (_) => '/inicio',
          loggedOut: () => '/login',
        );

      case '/inicio':
      case '/contatos':
      case '/servicos':
        return _authBloc.state.whenOrNull(loggedOut: () => '/login');

      case '/login':
        return _authBloc.state.whenOrNull(loggedIn: (_) => '/inicio');

      default:
        return null;
    }
  }

  static RouterService of(BuildContext context) =>
      context.read<RouterService>();
}

class GoRouterRefreshListenable extends ChangeNotifier {
  GoRouterRefreshListenable(BlocBase bloc) {
    notifyListeners();
    _sub = bloc.stream.listen((event) => notifyListeners());
  }

  late final StreamSubscription _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
