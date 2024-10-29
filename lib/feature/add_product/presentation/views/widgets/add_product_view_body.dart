import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_form_filed.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/is_featured_item.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late bool isFeatured = false;
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
            ImageField(
              onChanged: (value) {
                imageFile = value;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                if (imageFile != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    setState(() {});
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
