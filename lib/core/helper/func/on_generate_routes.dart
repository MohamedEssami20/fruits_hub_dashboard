import 'package:flutter/material.dart';

import '../../../feature/dashboard/presentation/views/dashboard_view.dart';


Route<dynamic>? onGenerateRoute(RouteSettings? routeSettings) {
  switch (routeSettings!.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
