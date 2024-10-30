import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.addProductRepo})
      : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final AddProductRepo addProductRepo;

  //create method for adding product
  Future<void> addProduct(
      {required AddProductInputEntity addProductInputEntity}) async {
      emit(AddProductLoading());
    Either<Failure, String> result =
        await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (failure) {
        emit(
          AddProductFailure(errorMessage: failure.errorMessage),
        );
      },
      (imageUrl) async {
        addProductInputEntity.iamgeUrl = imageUrl;
        Either<Failure, void> result =
            await addProductRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) {
            emit(
              AddProductFailure(errorMessage: failure.errorMessage),
            );
          },
          (success) {
            emit(AddProductSucess());
          },
        );
      },
    );
  }
}
