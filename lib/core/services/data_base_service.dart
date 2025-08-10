import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});

  //create method to get usesr data from database;
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  // create method to get stream of data from database;
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamData(
      {required String path, Map<String, dynamic>? query});

  // create method that check if data is exits;
  Future<bool> checkDataExists(
      {required String path, required String documentId});
}
