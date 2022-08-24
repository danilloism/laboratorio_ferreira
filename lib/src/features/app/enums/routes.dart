enum Routes {
  home(relativePath: '/', name: 'Home', fullPath: '/'),
  splash(relativePath: '/welcome', name: 'Splash', fullPath: '/welcome'),
  login(relativePath: '/login', name: 'Login', fullPath: '/login'),
  settings(relativePath: 'settings', name: 'Settings', fullPath: '/settings'),
  detalhesContato(
      relativePath: 'detalhesContato/:id',
      name: 'DetalhesContato',
      fullPath: '/detalhesContato');

  final String relativePath;
  final String name;
  final String fullPath;
  const Routes(
      {required this.relativePath, required this.name, required this.fullPath});
}
