import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo_impl.dart';

class GetItService {
  final getIt = GetIt.instance;

   void setupGetit() {
    getIt.registerSingleton<StorageService>(FireStorage());
    getIt.registerSingleton<DataBaseService>(FirestoreService());
    getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(
        storageService: getIt<StorageService>(),
      ),
    );
    getIt.registerSingleton<AddProductRepo>(
      AddProductRepoImpl(
        dataBaseService: getIt.get<DataBaseService>(),
      ),
    );
  }
}
