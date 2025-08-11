import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';

import '../../../../../../core/enums/order_status.dart';
part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit({required this.ordersRepo}) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  // create method that update order status
  Future<void> updateOrderStatus(
      {required OrderStatus status, required String orderId}) async {
    emit(UpdateOrderLoading());
    final result =
        await ordersRepo.updateOrderStatus(status: status, orderId: orderId);
    result.fold(
      (failure) => emit(
        UpdateOrderFailure(errorMessage: failure.errorMessage),
      ),
      (r) => emit(
        UpdateOrderSuccess(),
      ),
    );
  }
}
