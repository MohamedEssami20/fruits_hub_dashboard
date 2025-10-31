import 'dart:io';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productId;
  final String name;
  final String code;
  final num price;
  final File? image;
  final bool isFeatured;
  final String description;
  String? iamgeUrl;
  final int expeireationMonths;
  final bool isOraganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final int sellingCount;
  final String productType;
  AddProductInputModel(
      {required this.productId,
      required this.name,
      required this.productType,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.description,
      required this.expeireationMonths,
      required this.isOraganic,
      required this.numberOfCalories,
      required this.avgRating,
      required this.ratingCount,
      required this.unitAmount,
      this.sellingCount = 0,
      this.iamgeUrl});

  factory AddProductInputModel.fromProductEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
        productId: addProductInputEntity.id,
        name: addProductInputEntity.name,
        productType: addProductInputEntity.productType,
        code: addProductInputEntity.code,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured,
        description: addProductInputEntity.description,
        iamgeUrl: addProductInputEntity.iamgeUrl,
        expeireationMonths: addProductInputEntity.expeireationMonths,
        isOraganic: addProductInputEntity.isOraganic,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        avgRating: addProductInputEntity.avgRating,
        ratingCount: addProductInputEntity.ratingCount,
        unitAmount: addProductInputEntity.unitAmount);
  }

  toJson() {
    return {
      "productId": productId,
      "name": name,
      "code": code,
      "price": price,
      "productType": productType,
      "iamgeUrl": iamgeUrl,
      "isFeatured": isFeatured,
      "description": description,
      "expeireationMonths": expeireationMonths,
      "isOraganic": isOraganic,
      "numberOfCalories": numberOfCalories,
      "avgRating": avgRating,
      "ratingCount": ratingCount,
      "unitAmount": unitAmount,
      "sellingCount": sellingCount,
    };
  }
}
