import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/manager/get_orders_cubit/orders_cubit.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_order_dummy_data.dart';

class GetOrdersBlocBuilder extends StatefulWidget {
  const GetOrdersBlocBuilder({super.key});

  @override
  State<GetOrdersBlocBuilder> createState() => _GetOrdersBlocBuilderState();
}

class _GetOrdersBlocBuilderState extends State<GetOrdersBlocBuilder> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is GetOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is GetOrdersFailure) {
          return Center(
            child: Text('Error: ${state.errorMessage}'),
          );
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [
                getDummyOrderEntity(),
                getDummyOrderEntity(),
                getDummyOrderEntity(),
              ],
            ),
          );
        }
      },
    );
  }
}
