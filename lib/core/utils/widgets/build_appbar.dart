import 'package:flutter/material.dart';

import '../app_text_style.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold16,
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
    ),
  );
}
