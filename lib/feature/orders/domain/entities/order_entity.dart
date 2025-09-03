

import 'order_address_details_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final String userId;
  final String totalPrice;
  final OrderAddressDetailsEntity orderAddressDetailsEntity;
  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;
  final Map<String, dynamic> status;
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
  

   /// 🔹 ترتيب الحالات
  static const List<String> _orderedKeys = [
    'trackingOrder',
    'acceptedOrder',
    'orderShipped',
    'orderOnWay',
    'orderReceived',
  ];

  /// 🔹 ترجع آخر حالة مفتعلة مش "قيد الإنتظار"
  String get lastStatusKey {
    for (final key in _orderedKeys.reversed) {
      final value = status[key];
      if (value != null && value != "قيد الإنتظار") {
        return key;
      }
    }
    return 'trackingOrder'; // fallback
  }

  /// 🔹 ترجمة الحالة لعرضها بالعربي
  String get lastStatusLabel {
    switch (lastStatusKey) {
      case 'trackingOrder':
        return "تم تسجيل الطلب";
      case 'acceptedOrder':
        return "تم قبول الطلب";
      case 'orderShipped':
        return "تم شحن الطلب";
      case 'orderOnWay':
        return "الطلب في الطريق";
      case 'orderReceived':
        return "تم استلام الطلب";
      default:
        return "غير معروف";
    }
  }

  /// 🔹 تاريخ آخر حالة
  String get lastStatusDate {
    return status[lastStatusKey] ?? "";
  }
}
