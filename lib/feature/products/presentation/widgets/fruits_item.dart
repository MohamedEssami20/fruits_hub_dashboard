import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/my_colors.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/views/edit_product_view.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/custom_network_image.dart';
import '../../domain/entities/product_entity.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: product.iamgeUrl != null
                      ? CustomNetowrkImage(
                          imageUrl: product.iamgeUrl!,
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                        ),
                ),
                ListTile(
                  //isThreeLine: true,
                  contentPadding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 12),
                  title: Text(
                    product.name,
                    style: TextStyles.semiBold16.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${product.price} egp",
                          style: TextStyles.bold13.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                          style: TextStyles.semiBold13,
                        ),
                        TextSpan(
                          text: "kg",
                          style: TextStyles.semiBold13.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        EditProductView.routeName,
                        arguments: product,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.kPrimaryColor,
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
