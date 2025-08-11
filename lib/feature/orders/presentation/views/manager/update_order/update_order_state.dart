part of 'update_order_cubit.dart';

@immutable
sealed class UpdateOrderState {}

final class UpdateOrderInitial extends UpdateOrderState {}

// crate all state of update order
final class UpdateOrderLoading extends UpdateOrderState {}

final class UpdateOrderSuccess extends UpdateOrderState {}

final class UpdateOrderFailure extends UpdateOrderState {
  final String errorMessage;
  UpdateOrderFailure({required this.errorMessage});
}
