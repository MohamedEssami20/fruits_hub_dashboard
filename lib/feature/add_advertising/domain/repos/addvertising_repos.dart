import 'package:dartz/dartz.dart' show Either;
import 'package:fruits_hub_dashboard/feature/add_advertising/data/models/add_avertising_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class AddvertisingRepos {
  // create method that add addvertising to data base;
  Future<Either<Failure, void>> addAdvertising(AddAdvertisingInputModel adsModel);
}
