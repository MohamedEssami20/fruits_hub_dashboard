import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/data/models/reviews_model.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final num price;
  final File image;
  final bool isFeatured;
  final String description;
  String? iamgeUrl;
  final int expeireationMonths;
  final bool isOraganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewsModel> reviews;
  AddProductInputModel(
      {required this.name,
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
      required this.reviews,
      this.iamgeUrl});

  factory AddProductInputModel.fromProductEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
        reviews: addProductInputEntity.reviews
            .map((e) => ReviewsModel.fromReviewsEntity(e))
            .toList(),
        name: addProductInputEntity.name,
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
      "name": name,
      "code": code,
      "price": price,
      "iamgeUrl": iamgeUrl,
      "isFeatured": isFeatured,
      "description": description,
      "expeireationMonths": expeireationMonths,
      "isOraganic": isOraganic,
      "numberOfCalories": numberOfCalories,
      "avgRating": avgRating,
      "ratingCount": ratingCount,
      "unitAmount": unitAmount,
      "reviews": reviews
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
