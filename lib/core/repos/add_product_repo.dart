import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';

abstract class AddProductRepo {
  // create method that add product;
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
  
}
