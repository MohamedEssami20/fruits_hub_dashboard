import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onChanged});
  final ValueChanged<File?> onChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          try {
            await pickImageFromGallery();
          } catch (error) {
            isLoading = false;
            setState(() {});
            log("there was an error when picking image $error");
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: fileImage != null
                  ? Image.file(fileImage!)
                  : const Icon(
                      Icons.image_outlined,
                      size: 250,
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  fileImage = null;
                  widget.onChanged(fileImage);
                });
              },
              icon: fileImage != null
                  ? const Icon(
                      Icons.delete_sharp,
                      color: Colors.red,
                      size: 30,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    isLoading = true;
    setState(() {});
    final ImagePicker imagePicker = ImagePicker();
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    fileImage = File(file!.path);
    widget.onChanged(fileImage);
    setState(() {
      isLoading = false;
    });
  }
}
