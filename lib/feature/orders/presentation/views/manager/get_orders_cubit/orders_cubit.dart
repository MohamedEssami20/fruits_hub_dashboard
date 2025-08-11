import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';

import '../../../../domain/entities/order_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());
  final OrdersRepo ordersRepo;
  StreamSubscription? _streamSubscription;
  // create method that get all orders
  void getOrders() {
    emit(GetOrdersLoading());
    _streamSubscription = ordersRepo.getOrders().listen((result) {
      result.fold((failure) {
        emit(GetOrdersFailure(errorMessage: failure.errorMessage));
      }, (orders) {
        emit(GetOrdersSuccess(orders: orders));
      });
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
