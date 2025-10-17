import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/views/products_view.dart';

import '../../../feature/add_product/presentation/views/add_product_view.dart';
import '../../../feature/dashboard/presentation/views/dashboard_view.dart';
import '../../../feature/orders/presentation/views/orders_view.dart';
import '../../../feature/products/presentation/views/edit_product_view.dart';

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
    case OrdersView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OrdersView(),
      );
    case ProductsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductsView(),
      );
    case EditProductView.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditProductView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
