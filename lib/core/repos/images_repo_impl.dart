import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/constant/back_end_endpoints.dart/backend_end_point.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storae_service.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String imageUrl =
          await storageService.uploadImage(image, BackendEndPoint.imagePath);
      return right(imageUrl);
    } catch (e) {
      return left(
        ServerFailure(errorMessage: "Failed to upload image"),
      );
    }
  }
}
