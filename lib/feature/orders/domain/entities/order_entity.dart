
import 'package:fruits_hub_dashboard/core/enums/order_status.dart';

import 'order_address_details_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsEntity orderAddressDetailsEntity;
  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;
  final OrderStatus status;
  final String? date;
  final String orderId;

  OrderEntity(
      {required this.userId,
      required this.totalPrice,
      required this.orderAddressDetailsEntity,
      required this.orderProductEntity,
      required this.paymentMethod,
      required this.status,
      required this.orderId,
      this.date});
}
