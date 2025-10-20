import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/presentation/manager/cubit/add_advertising_cubit.dart';

import '../../../../core/repos/images_repo.dart';
import '../../domain/repos/addvertising_repos.dart';
import '../widgets/add_advertising_builder.dart';

class AddAdvertisingView extends StatelessWidget {
  const AddAdvertisingView({super.key});
  static const String routeName = "AddAdvertisingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Add Advertising"),
      body: BlocProvider(
        create: (context) => AddAdvertisingCubit(
          addvertisingRepos: GetItService().getIt<AddvertisingRepos>(),
          imagesRepo: GetItService().getIt<ImagesRepo>(),
        ),
        child: const AddAdvertisingBuilder(),
      ),
    );
  }
}
