import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/get_order_dummy_data.dart';

import 'filter_section.dart';
import 'order_item.dart';

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
          OrderItem(
            order: getDummyOrderModel(),
          ),
        ],
      ),
    );
  }
}
