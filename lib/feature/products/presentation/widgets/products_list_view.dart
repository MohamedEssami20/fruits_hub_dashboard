import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import 'fruits_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214),
      itemBuilder: (context, index) => FruitsItem(
        product: products[index],
      ),
      itemCount: products.length,
    );
  }
}
