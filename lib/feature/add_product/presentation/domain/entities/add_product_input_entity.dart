import 'dart:io';


class AddProductInputEntity {
  final String id;
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
  AddProductInputEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.description,
    this.iamgeUrl,
    required this.expeireationMonths,
    this.isOraganic = false,
    required this.numberOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
  });
}
