import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        Icons.image_outlined,
        size: 250,
      ),
    );
  }
}
