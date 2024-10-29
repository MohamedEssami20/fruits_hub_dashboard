import 'package:flutter/material.dart';

import '../my_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 25,
        height: 25,
        duration: const Duration(milliseconds: 120),
        decoration: ShapeDecoration(
          color: isChecked ? MyColors.kPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color:
                  isChecked ? MyColors.kPrimaryColor : const Color(0xffDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
    );
  }
}
