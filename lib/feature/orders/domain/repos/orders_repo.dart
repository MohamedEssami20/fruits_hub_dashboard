import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> getOrders();

  // create method that update order status;
  Future<Either<Failure, void>> updateOrderStatus(
      {required String orderId, required String key, required String userId});
}
