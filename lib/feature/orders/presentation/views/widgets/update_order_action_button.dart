import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/manager/update_order/update_order_cubit.dart';

import '../../../domain/entities/order_entity.dart';

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
        onPressed: () {
          final updateOrderCubit = context.read<UpdateOrderCubit>();
          updateOrderCubit.updateOrderStatus(
            orderId: order.orderId,
            key: nextKey,
            userId: order.userId,
          );
        },
        child: BlocBuilder<UpdateOrderCubit, UpdateOrderState>(
          builder: (context, state) {
            if (state is UpdateOrderLoading) {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            } else {
              return Text(
                nextLabel,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}