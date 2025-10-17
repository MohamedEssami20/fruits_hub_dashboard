import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/widgets/edit_product_view_body.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});
  static const String routeName = "edit-product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Edit Product"),
      body: const EditProductViewBody(),
    );
  }
}