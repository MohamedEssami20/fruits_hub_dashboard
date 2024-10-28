import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';

import 'core/helper/func/on_generate_routes.dart';
import 'firebase_options.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitsHubDashBoard());
}

class FruitsHubDashBoard extends StatelessWidget {
  const FruitsHubDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}


