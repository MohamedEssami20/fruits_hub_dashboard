import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';

abstract class ImagesRepo {
//create method that uoload image to firebase;
Future<Either<Failure, String >> uploadImage(File image);

// create method that edit image ;
Future<Either<Failure, String>> editProductImage({required File file});

}
