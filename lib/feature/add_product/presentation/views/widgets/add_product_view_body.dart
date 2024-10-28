import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_form_filed.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/image_field.dart';

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
        child:  Column(
          children: [
            const SizedBox(height: 40),
            const CustomTextFormFiled(
                hintText: "product name", textInputType: TextInputType.text),
            const SizedBox(height: 20),
            const CustomTextFormFiled(
              hintText: "product price",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const CustomTextFormFiled(
              hintText: "product code",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const CustomTextFormFiled(
              hintText: "product image",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const CustomTextFormFiled(
              hintText: "product descrption",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ImageField(onChanged: (value){},),
          ],
        ),
      ),
    );
  }
}
