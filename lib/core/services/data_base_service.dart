abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? documentId});

  //create method to get usesr data from database;
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  // create method that check if data is exits;
  Future<bool> checkDataExists({required String path, required String documentId});
}
