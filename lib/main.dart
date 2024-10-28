import 'package:flutter/material.dart';

import 'core/helper/func/on_generate_routes.dart';

void main() {
  runApp(const FruitsHubDashBoard());
}

class FruitsHubDashBoard extends StatelessWidget {
  const FruitsHubDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}


