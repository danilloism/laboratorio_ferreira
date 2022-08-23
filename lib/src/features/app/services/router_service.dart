import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/config.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/pages/home_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/view/pages/welcome_page.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/view/pages/login_page.dart';

class RouterService {
  late final router = GoRouter(
    debugLogDiagnostics: !Config.isProduction,
    initialLocation: Routes.splash.path,
    routes: [
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: Routes.splash.name,
        path: Routes.splash.path,
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );
}
