import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/func/custom_progress_hud.dart';

import '../../../../../core/helper/func/build_error_bar.dart';
import '../../../../../core/helper/func/build_success_bar.dart';
import '../manager/update_order/update_order_cubit.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          showSuccessBar(context, "sucessfully updated");
        }
        if (state is UpdateOrderFailure) {
          showErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
