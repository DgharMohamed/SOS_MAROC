import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/panic/presentation/pages/panic_page.dart';
import '../../features/services/presentation/pages/services_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static const String splash = SplashPage.routeName;
  static const String home = HomePage.routeName;
  static const String services = ServicesPage.routeName;
  static const String map = MapPage.routeName;
  static const String panic = PanicPage.routeName;
  static const String settings = SettingsPage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _material(const SplashPage());
      case home:
        return _material(const HomePage());
      case services:
        return _material(const ServicesPage());
      case map:
        return _material(const MapPage());
      case panic:
        return _material(const PanicPage());
      case settings:
        return _material(const SettingsPage());
      default:
        return _material(
          const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }

  static MaterialPageRoute _material(Widget child) =>
      MaterialPageRoute(builder: (_) => child);
}
