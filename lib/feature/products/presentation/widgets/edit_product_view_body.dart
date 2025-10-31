import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/func/build_error_bar.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_form_filed.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/is_featured_item.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/is_organic_product.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/feature/products/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/feature/products/presentation/manager/edit_product_cubit/edit_product_cubit.dart';

import '../../../add_product/presentation/domain/entities/add_product_input_entity.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late bool isFeatured = false;
  late bool isOraganic = false;
  late int expeireationMonths, numberOfCalories, unitAmount;
  late String currentImageUrl;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomTextFormFiled(
              onSaved: (value) {
                name = value!;
              },
              hintText: null,
              initialValue: widget.productEntity.name,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                price = num.parse(value!);
              },
              hintText: null,
              initialValue: widget.productEntity.price.toString(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                code = value!.toLowerCase();
              },
              hintText: null,
              initialValue: widget.productEntity.code,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                expeireationMonths = int.parse(value!);
              },
              hintText: null,
              initialValue: widget.productEntity.expeireationMonths.toString(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                numberOfCalories = int.parse(value!);
              },
              hintText: null,
              initialValue: widget.productEntity.numberOfCalories.toString(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                unitAmount = int.parse(value!);
              },
              hintText: null,
              initialValue: widget.productEntity.unitAmount.toString(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value!;
              },
              hintText: null,
              initialValue: widget.productEntity.description,
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            IsFeaturedItem(
                isChecked: widget.productEntity.isFeatured!,
                onCahanged: (val) {
                  isFeatured = val;
                }),
            const SizedBox(height: 20),
            IsOrganicProduct(
                isChecked: widget.productEntity.isOraganic,
                onCahanged: (val) {
                  widget.productEntity.isOraganic = val;
                }),
            const SizedBox(height: 20),
            ImageField(
              currentImage: currentImageUrl = widget.productEntity.iamgeUrl!,
              onChanged: (value) {
                imageFile = value;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                if (imageFile != null || currentImageUrl.isEmpty) {
                  log("image is not null");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    setState(() {});
                    AddProductInputEntity addProductInputEntity =
                        AddProductInputEntity(
                      id: widget.productEntity.id,
                      name: name,
                      price: price,
                      code: code,
                      description: description,
                      image: imageFile,
                      iamgeUrl: imageFile != null
                          ? null
                          : widget.productEntity.iamgeUrl,
                      isFeatured: isFeatured,
                      isOraganic: isOraganic,
                      unitAmount: unitAmount,
                      expeireationMonths: expeireationMonths,
                      numberOfCalories: numberOfCalories,
                      productType: widget.productEntity.productType,
                    );
                    await context.read<EditProductCubit>().editProduct(
                        addProductInputEntity: addProductInputEntity);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  log("image is null");
                  showErrorBar(context, "image is required");
                }
              },
              title: "Edit Product",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
