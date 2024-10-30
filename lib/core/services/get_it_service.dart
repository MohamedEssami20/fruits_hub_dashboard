
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storae_service.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  final getIt = GetIt.instance;

  void setupGetit() {
    getIt.registerSingleton<StoraeService>(FireStorage());
  }
}