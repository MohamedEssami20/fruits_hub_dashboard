import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/update_order_action_button.dart';

import '../../../../../core/enums/order_status.dart';

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
                  label: Text(
                    _getOrderStatus(order.status),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getOrderStatusColor(order.status),
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
            UpdateOrderActionButton(order: order),
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

  String _getOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.accepted:
        return 'accepted';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color _getOrderStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.accepted:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }
}
