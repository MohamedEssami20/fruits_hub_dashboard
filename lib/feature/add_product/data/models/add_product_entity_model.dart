import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';

class AddProductInputModel{
  final String name;
  final String code;
  final num price;
  final File image;
  final bool isFeatured;
  final String description;
  String? iamgeUrl;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.description,
      this.iamgeUrl});

  factory AddProductInputModel.fromProductEntity(AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured,
        description: addProductInputEntity.description,
        iamgeUrl: addProductInputEntity.iamgeUrl);
  }

  toJson() {
    return {
      "name": name,
      "code": code,
      "price": price,
      "iamgeUrl": iamgeUrl,
      "isFeatured": isFeatured,
      "description": description
    };
  }
}
