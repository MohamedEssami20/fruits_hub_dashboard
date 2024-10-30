import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/func/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';

import '../../../../../core/helper/func/build_error_bar.dart';
import '../../../../../core/helper/func/build_success_bar.dart';
import '../../manager/cubit/add_product_cubit.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is AddProductLoading,
            child: const AddProductViewBody());
      },
      
      listener: (context, state) {
        if (state is AddProductSucess) {
          showSuccessBar(context, "sucessfully added");
        }
        if (state is AddProductFailure) {
          showErrorBar(context, state.errorMessage);
        }
      },
    );
  }
}
