import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/utils/app_keys.dart';
import 'package:intl/intl.dart';
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
      await for (var (data as List<Map<String, dynamic>>)
          in _dataBaseService.getStreamData(path: "userOrders")) {
        List<OrderEntity> orders = data
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        log("orders= $orders");
        yield right(orders);
      }
    } on Exception catch (e) {
      yield left(ServerFailure(errorMessage: "Failed to get orders= $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus(
      {required String orderId,
      required String key,
      required String userId}) async {
    try {
      await _dataBaseService.updateData(
        mainPath: AppKeys.orderPath,
        mainDocumentId: userId,
        subDocumentId: orderId,
        subPath: AppKeys.userOrders,
        data: {
          "status.$key": convertDateTimeToString(),
        },
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error at updateOrderStatus 1= ${e.message}");
      return left(
        ServerFailure(errorMessage: e.message.toString()),
      );
    } catch (e) {
      log("error at updateOrderStatus 2= ${e.toString()}");
      return left(
        ServerFailure(errorMessage: "فشل في تحديث الطلب"),
      );
    }
  }
}

// create method that convert date time to string with intl package;
String convertDateTimeToString() {
  DateTime now = DateTime.now();
  Intl.defaultLocale = 'ar';
  String formattedDate = DateFormat.yMMMd().format(now).toString();
  return formattedDate;
}
