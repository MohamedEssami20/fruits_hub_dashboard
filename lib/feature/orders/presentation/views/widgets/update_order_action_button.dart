import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../domain/entities/order_entity.dart';
import '../manager/update_order/update_order_cubit.dart';

class UpdateOrderActionButton extends StatelessWidget {
  const UpdateOrderActionButton({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: order.status == OrderStatus.pending,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 3,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                    status: OrderStatus.accepted,
                    orderId: order.orderId,
                  );
            },
            child: const Text("Accept"),
          ),
        ),
        Visibility(
          visible: order.status == OrderStatus.pending,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 3,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                    status: OrderStatus.cancelled,
                    orderId: order.orderId,
                  );
            },
            child: const Text("Reject"),
          ),
        ),
        Visibility(
          visible: order.status == OrderStatus.accepted,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 3,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                    status: OrderStatus.delivered,
                    orderId: order.orderId,
                  );
            },
            child: const Text("Delivered"),
          ),
        ),
      ],
    );
  }
}
