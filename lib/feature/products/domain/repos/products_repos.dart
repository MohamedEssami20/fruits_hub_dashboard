
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../add_product/presentation/domain/entities/add_product_input_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepos {
  // create method that get all products;
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  // create method that edit product;
  Future<Either<Failure, void>> editProduct(
      {required AddProductInputEntity addProductInputEntity});
}
