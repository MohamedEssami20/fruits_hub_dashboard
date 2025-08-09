import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
          name: json["name"],
          imageUrl: json["imageUrl"],
          price: json["price"],
          quantity: json["quantity"]);

  toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "quantity": quantity
      };
  
  OrderProductEntity toEntity() => OrderProductEntity(
        name: name,
        imageUrl: imageUrl,
        price: price,
        quantity: quantity,
      );
}
