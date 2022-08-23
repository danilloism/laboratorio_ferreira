import 'package:go_router/go_router.dart';

enum Routes {
  home(path: '/', name: 'Home'),
  splash(path: '/welcome', name: 'Splash'),
  login(path: '/login', name: 'Login');

  final String path;
  final String name;
  const Routes({required this.path, required this.name});
}
