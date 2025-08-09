part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
// create all state of get orders;

final class GetOrdersLoading extends OrdersState {}

final class GetOrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;
  GetOrdersSuccess({required this.orders});
}

final class GetOrdersFailure extends OrdersState {
  final String errorMessage;
  GetOrdersFailure({required this.errorMessage});
}