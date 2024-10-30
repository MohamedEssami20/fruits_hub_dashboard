import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storae_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo_impl.dart';

class GetItService {
  final getIt = GetIt.instance;

  void setupGetit() {
    getIt.registerSingleton<StoraeService>(FireStorage());
    getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(
        storaeService: getIt<StoraeService>(),
      ),
    );
    getIt.registerSingleton<AddProductRepo>(AddProductRepoImpl());
  }
}
