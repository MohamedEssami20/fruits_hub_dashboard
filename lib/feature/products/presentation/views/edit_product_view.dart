import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/widgets/edit_product_bloc_consumer.dart';

import '../../../../core/repos/images_repo.dart';
import '../../domain/repos/products_repos.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.productEntity});
  static const String routeName = "edit-product";
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProductCubit(
        productsRepos: GetItService().getIt.get<ProductsRepos>(),
        imagesRepo: GetItService().getIt.get<ImagesRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "Edit Product"),
        body:  EditProductBlocConsumer(
          productEntity: productEntity,
        ),
      ),
    );
  }
}
