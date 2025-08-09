import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';

import '../../../../domain/entities/order_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  // create method that get all orders
  void getOrders() async {
    emit(GetOrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (failure) => emit(
        GetOrdersFailure(errorMessage: failure.errorMessage),
      ),
      (orders) => emit(
        GetOrdersSuccess(orders: orders),
      ),
    );
  }
}
