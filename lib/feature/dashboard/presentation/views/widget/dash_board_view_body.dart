import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/orders_view.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/views/products_view.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductView.routeName);
            },
            title: "Add Data",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersView.routeName);
            },
            title: "View Orders",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProductsView.routeName);
            },
            title: "View Products",
          ),
        ),
      ],
    );
  }
}
