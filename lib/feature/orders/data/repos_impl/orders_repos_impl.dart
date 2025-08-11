import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status.dart';
import '../../../../core/constant/back_end_endpoints.dart/backend_end_point.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/data_base_service.dart';
import '../../domain/entities/order_entity.dart' show OrderEntity;
import '../../domain/repos/orders_repo.dart';
import '../models/order_model.dart';

class OrdersReposImpl implements OrdersRepo {
  final DataBaseService _dataBaseService;

  const OrdersReposImpl({
    required DataBaseService dataBaseService,
  }) : _dataBaseService = dataBaseService;

  @override
  Stream<Either<Failure, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>) in _dataBaseService
          .getStreamData(path: BackendEndPoint.getOrdersPath)) {
        List<OrderEntity> orders = data
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield right(orders);
      }
    } on Exception catch (e) {
      yield left(ServerFailure(errorMessage: "Failed to get orders= $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus(
      {required OrderStatus status, required String orderId}) async {
    try {
      await _dataBaseService.updateData(
          path: BackendEndPoint.updateOrderStatusPath,
          data: {"status": status.name},
          documentId: orderId);
      return right(null);
    } on Exception catch (e) {
      return left(
        ServerFailure(errorMessage: "Failed to update order= $e"),
      );
    }
  }
}
