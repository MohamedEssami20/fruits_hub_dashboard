import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const routeName = "products";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "products"),
      body: const ProductsViewBody(),
    );
  }
}