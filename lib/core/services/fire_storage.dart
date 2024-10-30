import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storae_service.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StoraeService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basename(file.path);
    String fileExetension = p.extension(file.path);
    Reference reference =
        storageReference.child("$path/$fileName.$fileExetension");
    await reference.putFile(file);
    String fileUrl = await reference.getDownloadURL();
    return fileUrl;
  }
}
