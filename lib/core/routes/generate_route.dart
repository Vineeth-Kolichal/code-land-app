import 'package:dev_test/core/routes/app_routes.dart';
import 'package:dev_test/features/authentication/presentation/pages/login_page.dart';
import 'package:dev_test/features/home/presentation/pages/home_page.dart';
import 'package:dev_test/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouteGenerate {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (ctx) => const LoginPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (ctx) => const HomePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return const Scaffold(
        body: Center(
          child: Text('Something Error'),
        ),
      );
    });
  }
}
