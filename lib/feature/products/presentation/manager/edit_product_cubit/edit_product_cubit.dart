import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/app_keys.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/repos/products_repos.dart';

import '../../../../add_product/presentation/domain/entities/add_product_input_entity.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit({required this.imagesRepo, required this.productsRepos})
      : super(EditProductInitial());

  final ProductsRepos productsRepos;
  final ImagesRepo imagesRepo;
  // create all state of edit product;
  Future<void> editProduct(
      {required AddProductInputEntity addProductInputEntity}) async {
    emit(EditProductLoading());
    if (addProductInputEntity.image != null) {
      final image = await imagesRepo.uploadImage(addProductInputEntity.image!);
      image.fold(
        (failure) {
          emit(
            EditProductFailure(errormessage: failure.errorMessage),
          );
        },
        (imageUrl) async {
          addProductInputEntity.iamgeUrl = AppKeys.baseImageUrl + imageUrl;
          final result = await productsRepos.editProduct(
              addProductInputEntity: addProductInputEntity);
          result.fold(
            (failure) {
              emit(
                EditProductFailure(errormessage: failure.errorMessage),
              );
            },
            (success) {
              emit(
                EditProductSuccess(),
              );
            },
          );
        },
      );
    } else {
      final result = await productsRepos.editProduct(
          addProductInputEntity: addProductInputEntity);
      result.fold(
        (failure) {
          emit(
            EditProductFailure(errormessage: failure.errorMessage),
          );
        },
        (success) {
          emit(
            EditProductSuccess(),
          );
        },
      );
    }
  }
}
