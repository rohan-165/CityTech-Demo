import 'package:flutter/material.dart';
import 'package:product/core/route/routes.dart';
import 'package:product/dashboard/presentation/screen/dashboard_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? argument = settings.arguments;

    switch (settings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const DashboardScreen(),
        );
    }
  }
}
