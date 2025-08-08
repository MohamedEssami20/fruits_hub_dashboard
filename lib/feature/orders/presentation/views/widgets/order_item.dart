import 'package:flutter/material.dart';
import '../../../data/models/order_model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;

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
                  label: Text(
                    order.status ?? "Pending",
                    style: TextStyle(
                      color: order.status == "completed"
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                  backgroundColor: (order.status == "completed"
                          ? Colors.green
                          : Colors.orange)
                      .withAlpha(1),
                ),
                Text(
                  order.date != null ? _formatDate("${order.date}") : "No date",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // بيانات المشتري
            Text(
              order.orderAddressDetailsModel.fullName ?? "Unknown User",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(order.orderAddressDetailsModel.address ?? "No Address"),
            Text(order.orderAddressDetailsModel.phone ?? "No Phone"),
            const Divider(height: 20),

            // المنتجات
            ...order.orderProductModel.map((product) {
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
                      fontWeight: FontWeight.bold, color: Colors.green),
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
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final dateTime = DateTime.parse(dateString);
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    } catch (e) {
      return dateString;
    }
  }
}
