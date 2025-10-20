import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/data/models/add_avertising_input_model.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/domain/repos/addvertising_repos.dart';

import '../../domain/entities/add_advertising_inputs_entity.dart';

class AdvertisingReposImpl implements AddvertisingRepos{

  final DataBaseService dataBaseService;

  AdvertisingReposImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addAdvertising(AddAdvertisingInputsEntity adsModel) async{
    try {
      await dataBaseService.addData(
        documentId: adsModel.id,
        path: "advertising",
        data: AddAdvertisingInputModel.fromProductEntity(adsModel).toJson(),
      );
      return right(null);
    } 
    on FirebaseException catch (e) {
      log("error at addAdvertising= ${e.message}");
      return left(
        ServerFailure(errorMessage: e.message!),
      );
    }
    catch (e) {
      log("error at addAdvertising= $e");
      return left(
        ServerFailure(errorMessage: "Failed to add advertising"),
      );
    }
  }
}