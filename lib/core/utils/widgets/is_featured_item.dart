import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_checkbox.dart';
import '../../../../../core/utils/app_text_style.dart';

class IsFeaturedItem extends StatefulWidget {
  const IsFeaturedItem({super.key, required this.onCahanged});
  final ValueChanged<bool> onCahanged;
  @override
  State<IsFeaturedItem> createState() => _IsFeaturedItemState();
}

class _IsFeaturedItemState extends State<IsFeaturedItem> {
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
                text: "Is Featured Item",
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
