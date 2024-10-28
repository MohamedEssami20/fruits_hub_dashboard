import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';
import '../../../../core/utils/widgets/build_appbar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = "AddProductView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Add Product"),
      body: const AddProductViewBody(),
    );
  }
}
