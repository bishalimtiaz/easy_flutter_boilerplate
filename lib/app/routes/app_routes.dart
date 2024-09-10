final class Route {
  final String name;
  final String path;

  const Route({
    required this.name,
    required this.path,
  });
}

abstract class AppRoutes {
  AppRoutes._();

  static const Route splash = Route(name: 'splash', path: '/splash');
  static const Route landing = Route(name: 'landing', path: '/landing');
  static const Route order = Route(name: 'order', path: '/order');
  static const Route home = Route(name: 'home', path: '/home');
  static const Route profile = Route(name: 'profile', path: '/profile');
}
