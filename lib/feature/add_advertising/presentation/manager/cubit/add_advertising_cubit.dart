import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/app_keys.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/domain/repos/addvertising_repos.dart';

import '../../../../../core/repos/images_repo.dart';
import '../../../data/models/add_avertising_input_model.dart';

part 'add_advertising_state.dart';

class AddAdvertisingCubit extends Cubit<AddAdvertisingState> {
  AddAdvertisingCubit(
      {required this.addvertisingRepos, required this.imagesRepo})
      : super(AddAdvertisingInitial());

  final AddvertisingRepos addvertisingRepos;
  final ImagesRepo imagesRepo;

  Future<void> addAdvertising(AddAdvertisingInputModel adsModel) async {
    emit(AddAdvertisingLoading());
    final addProductImage = await imagesRepo.uploadImage(adsModel.image!);
    addProductImage.fold(
      (failure) {
        emit(AddAdvertisingError(errorMessage: failure.errorMessage));
      },
      (imageUrl) async {
        adsModel.iamgeUrl = AppKeys.baseImageUrl + imageUrl;
        final result = await addvertisingRepos.addAdvertising(adsModel);
        result.fold(
          (failure) {
            emit(
              AddAdvertisingError(errorMessage: failure.errorMessage),
            );
          },
          (success) {
            emit(
              AddAdvertisingSucess(),
            );
          },
        );
      },
    );
  }
}
