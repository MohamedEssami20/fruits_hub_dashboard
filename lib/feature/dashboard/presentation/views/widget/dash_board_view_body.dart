import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/Widgets/custom_button.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            onPressed: () {},
            title: "Add Data",
          ),
        ),
      ],
    );
  }
}
