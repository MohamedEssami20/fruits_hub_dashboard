import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_checkbox.dart';
import '../../../../../core/utils/app_text_style.dart';

class IsFeaturedItem extends StatefulWidget {
  const IsFeaturedItem(
      {super.key, required this.onCahanged, this.isChecked = false});
  final ValueChanged<bool> onCahanged;
  final bool? isChecked;
  @override
  State<IsFeaturedItem> createState() => _IsFeaturedItemState();
}

class _IsFeaturedItemState extends State<IsFeaturedItem> {
  bool termsAndCondition = false;
  late bool isChecked;
  @override
  void initState() {
    isChecked = widget.isChecked ?? termsAndCondition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isChecked,
          onChanged: (value) {
            termsAndCondition = value!;
            setState(() {
              isChecked = value;
            });
            widget.onCahanged(isChecked);
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
