import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/navigation_index_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

enum Routes {
  home(path: '/'),
  welcome(path: '/welcome'),
  settings(path: '/settings'),
  login(path: '/login');

  final String path;

  const Routes({required this.path});

  Widget Function(BuildContext, GoRouterState) get builder {
    switch (this) {
      case Routes.home:
        return (_, __) => BlocProvider<NavigationIndexCubit>(
              create: (_) => NavigationIndexCubit(),
              child: const HomePage(),
            );
      case Routes.welcome:
        return (_, __) => const WelcomePage();
      case Routes.settings:
        return (_, __) => const SettingsPage();
      case Routes.login:
        return (_, __) => BlocProvider<LoginFormCubit>(
              create: (_) => LoginFormCubit(),
              child: const LoginPage(),
            );
    }
  }
}
