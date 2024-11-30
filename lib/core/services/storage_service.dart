import 'dart:io';

abstract class StorageService {
  // create method to upload image to firebase;
  Future<String> uploadImage(File file, String path);
}
