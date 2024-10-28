import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_form_filed.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: const Column(
          children: [
            SizedBox(height: 40),
            CustomTextFormFiled(
                hintText: "product name", textInputType: TextInputType.text),
            SizedBox(height: 20),
            CustomTextFormFiled(
              hintText: "product price",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextFormFiled(
              hintText: "product code",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextFormFiled(
              hintText: "product image",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextFormFiled(
              hintText: "product descrption",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
