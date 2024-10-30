import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';
import '../../../../core/utils/widgets/build_appbar.dart';
import '../manager/cubit/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = "AddProductView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Add Product"),
      body: BlocProvider(
         create:(context){
        return AddProductCubit(
          addProductRepo:GetItService().getIt<AddProductRepo>(),
          imagesRepo:GetItService().getIt<ImagesRepo>(),);
      } , child: const AddProductViewBody()),
    );
  }
}
