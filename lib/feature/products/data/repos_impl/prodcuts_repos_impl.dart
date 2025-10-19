import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/entities/product_entity.dart';

import '../../../../core/constant/back_end_endpoints.dart/backend_end_point.dart';
import '../../../add_product/data/models/add_product_entity_model.dart';
import '../../domain/repos/products_repos.dart';
import '../models/product_model.dart';

class ProdcutsReposImpl implements ProductsRepos {
  final DataBaseService dataBaseService;
  ProdcutsReposImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndPoint.getProductPath,
      );
      List<ProductEntity> products = data
          .map(
            (e) => ProductModel.formJson(e).toEntity(),
          )
          .toList();
      return right(products);
    } on FirebaseException catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> editProduct(
      {required AddProductInputEntity addProductInputEntity}) async {
    try {
      await dataBaseService.updateData(
        mainPath: BackendEndPoint.getProductPath,
        mainDocumentId: addProductInputEntity.id,
        subPath: null,
        subDocumentId: null,
        data: AddProductInputModel.fromProductEntity(addProductInputEntity)
            .toJson(),
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error at editProduct= ${e.message.toString()}");
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (error) {
      log("error at editProduct= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
