import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/build_appbar.dart';

import '../widgets/add_advertising_view_body.dart';

class AddAdvertisingView extends StatelessWidget {
  const AddAdvertisingView({super.key});
  static const String routeName = "AddAdvertisingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Add Advertising"),
      body: const AddAdvertisingViewBody(),
    );
  }
}
