import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';

import '../../domain/repos/orders_repo.dart';
import 'manager/cubit/orders_cubit.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(
        ordersRepo: GetItService().getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
          centerTitle: true,
        ),
        body: const OrdersViewBody(),
      ),
    );
  }
}
