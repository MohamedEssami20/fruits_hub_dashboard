import '../../domain/entities/order_entity.dart';
import 'order_address_details_model.dart';
import 'order_product_model.dart';

class OrderModel {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsModel orderAddressDetailsModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  String? status = "pending";
  String?date;

  OrderModel(
      {required this.userId,
      required this.totalPrice,
      required this.orderAddressDetailsModel,
      required this.orderProductModel,
      required this.paymentMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      userId: json['userId'],
      totalPrice: json['totalPrice'],
      orderAddressDetailsModel:
          OrderAddressDetailsModel.fromJson(json['orderAddressDetailsModel']),
      orderProductModel: List<OrderProductModel>.from(
          json['orderProductModel'].map((x) => OrderProductModel.fromJson(x))),
      paymentMethod: json['paymentMethod']);

  // create to json method
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'status': "pending",
        'date': DateTime.now().toString(),
        'totalPrice': totalPrice,
        'orderAddressDetailsModel': orderAddressDetailsModel.toJson(),
        'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };

  // create to entity method
  OrderEntity toEntity() => OrderEntity(
        userId: userId,
        totalPrice: totalPrice,
        orderAddressDetailsEntity: orderAddressDetailsModel.toEntity(),
        orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
      );
}
