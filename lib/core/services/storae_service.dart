import 'dart:io';

abstract class StoraeService {
  // create method to upload image to firebase;

  Future<String> uploadImage(File file, String path);
}
