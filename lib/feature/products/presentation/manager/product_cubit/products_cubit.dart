import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/repos/products_repos.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/product_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepos}) : super(ProductsInitial());
  final ProductsRepos productRepos;
  int resultOfProduct = 0;
  // create method to get products;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<ProductEntity>> result =
        await productRepos.getAllProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errormessage: failure.errorMessage)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
