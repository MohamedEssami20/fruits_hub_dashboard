import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          try {
            isLoading = true;
            setState(() {});
            final ImagePicker imagePicker = ImagePicker();
            final XFile? file =
                await imagePicker.pickImage(source: ImageSource.gallery);
            setState(() {
              isLoading = false;
            });
          } catch (error) {
            isLoading = false;
            setState(() {});
            log("there was an error when picking image $error");
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.image_outlined,
            size: 250,
          ),
        ),
      ),
    );
  }
}
