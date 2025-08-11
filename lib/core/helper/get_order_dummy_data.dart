import 'package:fruits_hub_dashboard/core/enums/order_status.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_address_details_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_product_entity.dart';

OrderEntity getDummyOrderEntity() {
  return OrderEntity(
    orderId: "order_123456",
    status:OrderStatus.accepted ,
    userId: "user_123456",
    totalPrice: "450.00",
    paymentMethod: "cash",
    orderAddressDetailsEntity: OrderAddressDetailsEntity(
      fullName: "محمد أحمد",
      email: "mohamed@example.com",
      address: "شارع التحرير، عمارة 5",
      phone: "01012345678",
      city: "القاهرة",
      floorName: "الدور الثالث",
    ),
    orderProductEntity: [
      OrderProductEntity(
        name: "قلم حبر",
        imageUrl: "https://via.placeholder.com/150",
        price: 25.0,
        quantity: 2,
      ),
      OrderProductEntity(
        name: "دفتر ملاحظات",
        imageUrl: "https://via.placeholder.com/150",
        price: 50.0,
        quantity: 3,
      ),
      OrderProductEntity(
        name: "آلة حاسبة",
        imageUrl: "https://via.placeholder.com/150",
        price: 200.0,
        quantity: 1,
      ),
    ],
  );
}
