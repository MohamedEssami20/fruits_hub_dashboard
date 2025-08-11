import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/get_orders_bloc_builder.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/update_order_builder.dart';

import '../../domain/repos/orders_repo.dart';
import 'manager/get_orders_cubit/orders_cubit.dart';
import 'manager/update_order/update_order_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrdersCubit(
            ordersRepo: GetItService().getIt.get<OrdersRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(
            ordersRepo: GetItService().getIt.get<OrdersRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
          centerTitle: true,
        ),
        body: const UpdateOrderBuilder(child: GetOrdersBlocBuilder()),
      ),
    );
  }
}
