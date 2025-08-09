import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

import '../../feature/orders/data/repos_impl/orders_repos_impl.dart';
import '../repos/images_repo_impl.dart';

class GetItService {
  final getIt = GetIt.instance;

  void setupGetit() {
    getIt.registerSingleton<StorageService>(SupabaseStorageService());
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

    getIt.registerSingleton<OrdersRepo>(
      OrdersReposImpl(
        dataBaseService: getIt.get<FirestoreService>(),
      ),
    );
  }
}
