import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/widgets/products_view_body.dart';

import '../../domain/repos/products_repos.dart';
import '../manager/product_cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const routeName = "products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "products"),
      body: BlocProvider(
        create: (context) => ProductsCubit(
            productRepos: GetItService().getIt.get<ProductsRepos>()),
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: ProductsViewBody(),
        ),
      ),
    );
  }
}
