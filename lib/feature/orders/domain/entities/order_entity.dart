import 'order_address_details_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsEntity orderAddressDetailsEntity;
  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;
  String? status = "pending";
  String? date;

  OrderEntity(
      {required this.userId,
      required this.totalPrice,
      required this.orderAddressDetailsEntity,
      required this.orderProductEntity,
      required this.paymentMethod});
}
