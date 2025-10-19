import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/func/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/widgets/edit_product_view_body.dart';

import '../../../../../core/helper/func/build_error_bar.dart';
import '../../../../../core/helper/func/build_success_bar.dart';

class EditProductBlocConsumer extends StatelessWidget {
  const EditProductBlocConsumer({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProductCubit, EditProductState>(
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is EditProductLoading,
          child: EditProductViewBody(
            productEntity: productEntity,
          ),
        );
      },
      listener: (context, state) {
        if (state is EditProductSuccess) {
          showSuccessBar(context, "sucessfully Edited");
        }
        if (state is EditProductFailure) {
          showErrorBar(context, state.errormessage);
        }
      },
    );
  }
}
