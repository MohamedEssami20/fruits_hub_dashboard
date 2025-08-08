import '../../feature/orders/data/models/order_address_details_model.dart';
import '../../feature/orders/data/models/order_model.dart';
import '../../feature/orders/data/models/order_product_model.dart';

OrderModel getDummyOrderModel() {
  return OrderModel(
    userId: "user_123456",
    totalPrice: "450.00",
    paymentMethod: "cash",
    orderAddressDetailsModel: OrderAddressDetailsModel(
      fullName: "محمد أحمد",
      email: "mohamed@example.com",
      address: "شارع التحرير، عمارة 5",
      phone: "01012345678",
      city: "القاهرة",
      floorName: "الدور الثالث",
    ),
    orderProductModel: [
      OrderProductModel(
        name: "قلم حبر",
        imageUrl: "https://via.placeholder.com/150",
        price: 25.0,
        quantity: 2,
      ),
      OrderProductModel(
        name: "دفتر ملاحظات",
        imageUrl: "https://via.placeholder.com/150",
        price: 50.0,
        quantity: 3,
      ),
      OrderProductModel(
        name: "آلة حاسبة",
        imageUrl: "https://via.placeholder.com/150",
        price: 200.0,
        quantity: 1,
      ),
    ],
  );
}
