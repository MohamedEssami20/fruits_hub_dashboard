import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/dashboard/presentation/views/widget/dash_board_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashBoardViewBody(),
    );
  }
}
