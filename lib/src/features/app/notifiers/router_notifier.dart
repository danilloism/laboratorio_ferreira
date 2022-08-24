import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/enums/routes.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authNotifierProvider, (_, __) => notifyListeners());
  }

  String? getRedirectLogic(GoRouterState state) {
    final notifier = _ref.read(authNotifierProvider.notifier);
    final authState = _ref.read(authNotifierProvider);
    final location = state.location;

    if (authState == const AuthState.loggedOut() &&
        location != Routes.login.relativePath) return Routes.login.relativePath;
    if (notifier.session != null &&
        (location == Routes.login.relativePath ||
            location == Routes.splash.relativePath)) {
      return Routes.home.relativePath;
    }

    return null;
  }
}
