import 'package:fruits_hub_dashboard/feature/add_product/presentation/domain/entities/reviews_entity.dart';

class ReviewsModel {
  final String name;
  final num ratting;
  final String date;
  final String image;
  final String reviewDescription;

  ReviewsModel(
      {required this.name,
      required this.ratting,
      required this.date,
      required this.image,
      required this.reviewDescription});
  
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      name: json["name"],
      ratting: json["ratting"],
      date: json["date"],
      image: json["image"],
      reviewDescription: json["reviewDescription"],
    );
  }

  factory ReviewsModel.fromReviewsEntity(ReviewsEntity reviewsEntity) {
    return ReviewsModel(
      name: reviewsEntity.name,
      ratting: reviewsEntity.ratting,
      date: reviewsEntity.date,
      image: reviewsEntity.image,
      reviewDescription: reviewsEntity.reviewDescription,
    );
  }

  toJson() {
    return {
      "name": name,
      "ratting": ratting,
      "date": date,
      "image": image,
      "reviewDescription": reviewDescription,
    };
  }
}
