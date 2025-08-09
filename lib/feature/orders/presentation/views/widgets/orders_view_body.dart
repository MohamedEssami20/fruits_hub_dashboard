import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/order_item_list_view.dart';

import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});
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
              orders: [
                getDummyOrderModel(),
                getDummyOrderModel(),
                getDummyOrderModel(),
                getDummyOrderModel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
