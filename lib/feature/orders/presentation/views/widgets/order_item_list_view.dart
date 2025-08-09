import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/data/models/order_model.dart';

import 'order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderItem(
          order: orders[index],
        );
      },
    );
  }
}
