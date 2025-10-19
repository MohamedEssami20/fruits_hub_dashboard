import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_checkbox.dart';
import '../../../../../core/utils/app_text_style.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct(
      {super.key, required this.onCahanged, this.isChecked = false});
  final ValueChanged<bool> onCahanged;
  final bool? isChecked;
  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
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
            setState(
              () {
                isChecked = value;
              },
            );
            widget.onCahanged(isChecked);
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
