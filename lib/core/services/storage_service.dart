import 'dart:io';

abstract class StorageService {
  // create method to upload image to database;
  Future<String> uploadImage(File file, String path);
  
  // create method that edit image in database;
  Future<String> editImage(File file, String path);
}
