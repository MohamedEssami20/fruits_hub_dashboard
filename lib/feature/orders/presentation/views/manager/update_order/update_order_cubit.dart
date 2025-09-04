import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';
part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit({required this.ordersRepo}) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  // create method that update order status;
  void updateOrderStatus(
      {required String orderId,
      required String key,
      required String userId}) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrderStatus(
      key: key,
      orderId: orderId,
      userId: userId,
    );
    result.fold(
        (failure) =>
            emit(UpdateOrderFailure(errorMessage: failure.errorMessage)),
        (success) => emit(UpdateOrderSuccess()));
  }
}
