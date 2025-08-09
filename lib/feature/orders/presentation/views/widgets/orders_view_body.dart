import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/order_item_list_view.dart';

import '../../../domain/entities/order_entity.dart';
import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          const FilterSection(),
          Expanded(
            child: OrderItemListView(
              orders: orders,
            ),
          ),
        ],
      ),
    );
  }
}
