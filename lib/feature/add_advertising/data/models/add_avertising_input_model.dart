import 'dart:io';
import 'package:fruits_hub_dashboard/feature/add_advertising/domain/entities/add_advertising_inputs_entity.dart';

class AddAdvertisingInputModel {
  final String productId;
  final String advName;
  final String advDiscouunt;
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
  AddAdvertisingInputModel(
      {required this.productId,
      required this.name,
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
      required this.advName,
      required this.advDiscouunt,
      this.sellingCount = 0,
      this.iamgeUrl});

  factory AddAdvertisingInputModel.fromProductEntity(
      AddAdvertisingInputsEntity addAdvertisingInputEntity) {
    return AddAdvertisingInputModel(
        productId: addAdvertisingInputEntity.id,
        advName: addAdvertisingInputEntity.advName,
        advDiscouunt: addAdvertisingInputEntity.advDiscount,
        name: addAdvertisingInputEntity.name,
        code: addAdvertisingInputEntity.code,
        price: addAdvertisingInputEntity.price,
        image: addAdvertisingInputEntity.image,
        isFeatured: addAdvertisingInputEntity.isFeatured,
        description: addAdvertisingInputEntity.description,
        iamgeUrl: addAdvertisingInputEntity.iamgeUrl,
        expeireationMonths: addAdvertisingInputEntity.expeireationMonths,
        isOraganic: addAdvertisingInputEntity.isOraganic,
        numberOfCalories: addAdvertisingInputEntity.numberOfCalories,
        avgRating: addAdvertisingInputEntity.avgRating,
        ratingCount: addAdvertisingInputEntity.ratingCount,
        unitAmount: addAdvertisingInputEntity.unitAmount);
  }

  toJson() {
    return {
      "productId": productId,
      "advName": advName,
      "advDiscount": advDiscouunt,
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
      "sellingCount": sellingCount,
    };
  }
}
