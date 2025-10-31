import 'package:flutter/material.dart';

import '../../../../../core/constant/back_end_endpoints.dart/backend_end_point.dart';

class ChosseProductType extends StatelessWidget {
  const ChosseProductType({super.key, this.onchanged, this.value});
  final Function(String?)? onchanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: value ?? BackendEndPoint.banana,
          hint: const Text("Product Type"),
          items: const [
            DropdownMenuItem(
                value: BackendEndPoint.banana,
                child: Text(BackendEndPoint.banana)),
            DropdownMenuItem(
                value: BackendEndPoint.strawberry,
                child: Text(BackendEndPoint.strawberry)),
            DropdownMenuItem(
                value: BackendEndPoint.apple,
                child: Text(BackendEndPoint.apple)),
            DropdownMenuItem(
                value: BackendEndPoint.avocado,
                child: Text(BackendEndPoint.avocado)),
            DropdownMenuItem(
                value: BackendEndPoint.orange,
                child: Text(BackendEndPoint.orange)),
            DropdownMenuItem(
                value: BackendEndPoint.pineapple,
                child: Text(BackendEndPoint.pineapple)),
            DropdownMenuItem(
                value: BackendEndPoint.cries,
                child: Text(BackendEndPoint.cries)),
            DropdownMenuItem(
                value: BackendEndPoint.watermelon,
                child: Text(BackendEndPoint.watermelon)),
            DropdownMenuItem(
                value: BackendEndPoint.kiwi, child: Text(BackendEndPoint.kiwi)),
            DropdownMenuItem(
                value: BackendEndPoint.mango,
                child: Text(BackendEndPoint.mango)),
          ],
          onChanged: onchanged,
        ),
      ),
    );
  }
}
