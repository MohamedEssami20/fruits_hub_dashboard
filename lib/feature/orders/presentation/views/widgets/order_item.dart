import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_entity.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🆕 الحالة والتاريخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  color: WidgetStatePropertyAll(
                      getStatusColor(order.lastStatusLabel)),
                  label: Text(
                    order.lastStatusLabel,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  backgroundColor: Colors.grey,
                ),
                Text(
                  order.lastStatusDate,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // بيانات المشتري
            Text(
              order.orderAddressDetailsEntity.fullName ?? "Unknown User",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(order.orderAddressDetailsEntity.fullAddress),
            Text(order.orderAddressDetailsEntity.phone ?? "No Phone"),
            Text(order.orderAddressDetailsEntity.email ?? "No email"),

            const Divider(height: 20),

            // المنتجات
            ...order.orderProductEntity.map((product) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
                title: Text(product.name),
                subtitle: Text(
                    "${product.price.toStringAsFixed(2)} × ${product.quantity}"),
                trailing: Text(
                  "${(product.price * product.quantity).toStringAsFixed(2)} EGP",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              );
            }),

            const Divider(height: 20),

            // الإجمالي وطريقة الدفع
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ${order.totalPrice} EGP",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(order.paymentMethod),
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // زر التحديث
            UpdateOrderActionButton(order: order),
          ],
        ),
      ),
    );
  }

  // create method that getColor to get color of status
  Color getStatusColor(String status) {
    switch (status) {
      case 'trackingOrder' || "تم تسجيل الطلب":
        return Colors.green;
      case 'acceptedOrder' || "تم قبول الطلب":
        return Colors.orange;
      case 'orderShipped' || "تم شحن الطلب":
        return Colors.pinkAccent;
      case 'orderOnWay' || "الطلب في الطريق":
        return Colors.blue;
      case 'orderReceived' || "تم استلام الطلب":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

class UpdateOrderActionButton extends StatelessWidget {
  const UpdateOrderActionButton({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    final nextLabel = order.getNextStatusLabel;
    final nextKey = order.getNextStatusKey;

    if (nextKey == null || nextLabel == null) {
      return const SizedBox.shrink(); // يخفي الزر لو مفيش حالة تالية
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          nextLabel,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
