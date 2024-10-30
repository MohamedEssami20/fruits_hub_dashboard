import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/constant/back_end_endpoints.dart/backend_end_point.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/feature/add_product/data/models/add_product_entity_model.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DataBaseService dataBaseService;

  AddProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
        try {
          await dataBaseService.addData(
            path: BackendEndPoint.addProductPath,
            data: AddProductInputModel.fromProductEntity(addProductInputEntity).toJson(),
          );
          return right(null);
        } catch (e) {
          return left(
            ServerFailure(errorMessage: "Failed to add product"),
          );
        }
      }
}
