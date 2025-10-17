import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepos {

  // create method that get all products;
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}