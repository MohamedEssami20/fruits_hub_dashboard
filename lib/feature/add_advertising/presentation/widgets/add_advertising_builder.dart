import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/func/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/presentation/manager/cubit/add_advertising_cubit.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/presentation/widgets/add_advertising_view_body.dart';

import '../../../../../core/helper/func/build_error_bar.dart';
import '../../../../../core/helper/func/build_success_bar.dart';

class AddAdvertisingBuilder extends StatelessWidget {
  const AddAdvertisingBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAdvertisingCubit, AddAdvertisingState>(
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is AddAdvertisingLoading,
            child: const AddAdvertisingViewBody());
      },
      listener: (context, state) {
        if (state is AddAdvertisingSucess) {
          showSuccessBar(context, "sucessfully added advertising");
        }
        if (state is AddAdvertisingError) {
          showErrorBar(context, state.errorMessage);
        }
      },
    );
  }
}
