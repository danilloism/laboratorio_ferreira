import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class RouterService {
  final AuthBloc _authBloc;
  late final GoRouter router;

  RouterService(this._authBloc) {
    router = GoRouter(
      debugLogDiagnostics: !Config.isProduction,
      refreshListenable: GoRouterRefreshStream(_authBloc.stream),
      initialLocation: '/welcome',
      redirect: _redirect,
      routes: [
        GoRoute(
          name: Routes.home.name,
          path: Routes.home.path,
          builder: Routes.home.builder!,
        ),
        GoRoute(
          name: Routes.inicio.name,
          path: Routes.inicio.path,
          redirect: Routes.inicio.redirect!,
        ),
        GoRoute(
            name: Routes.contatos.name,
            path: Routes.contatos.path,
            redirect: Routes.contatos.redirect!,
            routes: [
              GoRoute(
                  name: Routes.detalhesContato.name,
                  path: Routes.detalhesContato.path,
                  builder: Routes.detalhesContato.builder!,
                  routes: [
                    GoRoute(
                      name: Routes.editarContato.name,
                      path: Routes.editarContato.path,
                      builder: Routes.editarContato.builder!,
                    ),
                  ]),
            ]),
        GoRoute(
          name: Routes.servicos.name,
          path: Routes.servicos.path,
          redirect: Routes.servicos.redirect!,
        ),
        GoRoute(
          name: Routes.login.name,
          path: Routes.login.path,
          builder: Routes.login.builder!,
        ),
        GoRoute(
          name: Routes.welcome.name,
          path: Routes.welcome.path,
          builder: Routes.welcome.builder!,
        ),
        GoRoute(
          name: Routes.settings.name,
          path: Routes.settings.path,
          builder: Routes.settings.builder!,
        ),
      ],
    );
  }

  String? _redirect(GoRouterState state) {
    switch (state.location) {
      case '/welcome':
        return _authBloc.state.whenOrNull(
          loggedIn: (_) => state.namedLocation(Routes.inicio.name),
          loggedOut: () => state.namedLocation(Routes.login.name),
        );

      case '/':
        return _authBloc.state.whenOrNull(
            loggedOut: () => state.namedLocation(Routes.login.name));

      case '/login':
        return _authBloc.state.whenOrNull(
            loggedIn: (_) => state.namedLocation(Routes.inicio.name));

      default:
        return null;
    }
  }

  static RouterService of(BuildContext context) =>
      context.read<RouterService>();
}
