import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/domain/entities/add_advertising_inputs_entity.dart';
import 'package:fruits_hub_dashboard/feature/add_advertising/presentation/manager/cubit/add_advertising_cubit.dart';

import '../../../../core/helper/func/generate_product_id.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_filed.dart';
import '../../../../core/utils/widgets/is_featured_item.dart';
import '../../../../core/utils/widgets/is_organic_product.dart';
import '../../../add_product/presentation/views/widgets/image_field.dart';

class AddAdvertisingViewBody extends StatefulWidget {
  const AddAdvertisingViewBody({super.key});

  @override
  State<AddAdvertisingViewBody> createState() => _AddAdvertisingViewBodyState();
}

class _AddAdvertisingViewBodyState extends State<AddAdvertisingViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String advName, advDiscount;
  late String name, code, description;
  late num price;
  late bool isFeatured = false;
  late bool isOraganic = false;
  late int expeireationMonths, numberOfCalories, unitAmount;
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
              hintText: "advertising name",
              textInputType: TextInputType.text,
              onSaved: (val) {
                advName = val!;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              hintText: "advertising discount",
              textInputType: TextInputType.text,
              onSaved: (value) {
                advDiscount = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                name = value!;
              },
              hintText: "product name",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                price = num.parse(value!);
              },
              hintText: "product price",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                code = value!.toLowerCase();
              },
              hintText: "product code",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                expeireationMonths = int.parse(value!);
              },
              hintText: "expeireation Months",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                numberOfCalories = int.parse(value!);
              },
              hintText: "number Of Calories",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                unitAmount = int.parse(value!);
              },
              hintText: "unit Amount",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value!;
              },
              hintText: "product descrption",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            IsFeaturedItem(onCahanged: (val) {
              isFeatured = val;
            }),
            const SizedBox(height: 20),
            IsOrganicProduct(onCahanged: (val) {
              isOraganic = val;
            }),
            const SizedBox(height: 20),
            ImageField(
              onChanged: (value) {
                imageFile = value;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                if (imageFile != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    setState(() {});
                    AddAdvertisingInputsEntity advertisingInputsEntity =
                        AddAdvertisingInputsEntity(
                      id: generateProductId(),
                      advName: advName,
                      advDiscount: advDiscount,
                      name: name,
                      price: price,
                      code: code,
                      description: description,
                      image: imageFile!,
                      isFeatured: isFeatured,
                      isOraganic: isOraganic,
                      unitAmount: unitAmount,
                      expeireationMonths: expeireationMonths,
                      numberOfCalories: numberOfCalories,
                    );
                    await context.read<AddAdvertisingCubit>().addAdvertising(
                          advertisingInputsEntity,
                        );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }
              },
              title: "Add Product",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
