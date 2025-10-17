import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/custom_error_widget.dart';
import '../../../../core/utils/get_dummy_products.dart';
import '../manager/product_cubit/products_cubit.dart';
import 'products_list_view.dart';

class ProductsListBuilder extends StatelessWidget {
  const ProductsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsListView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errorMessage: state.errormessage,
            ),
          );
        }
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsListView(
            products: getDummyProducts(),
          ),
        );
      },
    );
  }
}
