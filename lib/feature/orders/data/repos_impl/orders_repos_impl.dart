import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final data = await _dataBaseService.getData(
        path: BackendEndPoint.getOrdersPath,
      );

      List<OrderEntity> orders = (data as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      return right(orders);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: "Failed to get orders= $e"));
    }
  }
}
