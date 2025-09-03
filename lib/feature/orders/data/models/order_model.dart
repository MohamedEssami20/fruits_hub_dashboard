import '../../domain/entities/order_entity.dart';
import 'order_address_details_model.dart';
import 'order_product_model.dart';

class OrderModel {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsModel orderAddressDetailsModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  final Map<String, dynamic>? status;
  final String? date;
  final String orderId;

  OrderModel({
    required this.userId,
    required this.totalPrice,
    required this.orderAddressDetailsModel,
    required this.orderProductModel,
    required this.paymentMethod,
    required this.orderId,
    this.status,
    this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final rawStatus = json['status'];

    // الحالة لو كانت مجرد String
    Map<String, dynamic> statusMap;
    if (rawStatus is String) {
      statusMap = {
        'trackingOrder': rawStatus,
        'acceptedOrder': "قيد الإنتظار",
        'orderShipped': "قيد الإنتظار",
        'orderOnWay': "قيد الإنتظار",
        'orderReceived': "قيد الإنتظار",
      };
    } else {
      final rawMap = Map<String, dynamic>.from(rawStatus ?? {});
      statusMap = {
        'trackingOrder': rawMap['trackingOrder'] ?? "قيد الإنتظار",
        'acceptedOrder': rawMap['acceptedOrder'] ?? "قيد الإنتظار",
        'orderShipped': rawMap['orderShipped'] ?? "قيد الإنتظار",
        'orderOnWay': rawMap['orderOnWay'] ?? "قيد الإنتظار",
        'orderReceived': rawMap['orderReceived'] ?? "قيد الإنتظار",
      };
    }
    return OrderModel(
      userId: json['userId'],
      totalPrice: json['totalPrice'],
      orderAddressDetailsModel:
          OrderAddressDetailsModel.fromJson(json['orderAddressDetailsModel']),
      orderProductModel: List<OrderProductModel>.from(
          json['orderProductModel'].map((x) => OrderProductModel.fromJson(x))),
      paymentMethod: json['paymentMethod'],
      status: statusMap,
      date: json['date'],
      orderId: json['orderId'] ?? "",
    );
  }
  // create to entity method
  OrderEntity toEntity() => OrderEntity(
        userId: userId,
        orderId: orderId,
        totalPrice: totalPrice,
        orderAddressDetailsEntity: orderAddressDetailsModel.toEntity(),
        orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
        status: status!,
        date: date,
      );
}
