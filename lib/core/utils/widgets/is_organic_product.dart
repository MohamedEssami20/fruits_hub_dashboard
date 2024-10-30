import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_checkbox.dart';
import '../../../../../core/utils/app_text_style.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onCahanged});
  final ValueChanged<bool> onCahanged;
  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
  bool termsAndCondition = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: termsAndCondition,
          onChanged: (value) {
            termsAndCondition = value!;
            widget.onCahanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Is Oraganic Product",
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
