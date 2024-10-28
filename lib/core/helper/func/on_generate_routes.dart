import 'package:flutter/material.dart';

import '../../../feature/add_product/presentation/views/add_product_view.dart';
import '../../../feature/dashboard/presentation/views/dashboard_view.dart';


Route<dynamic>? onGenerateRoute(RouteSettings? routeSettings) {
  switch (routeSettings!.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(),
      );
    case AddProductView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddProductView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
