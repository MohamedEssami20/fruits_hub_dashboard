import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId == null) {
      await firebaseFirestore.collection(path).add(data);
    } else {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection(path).doc(documentId).get();
    return documentSnapshot.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkDataExists(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection(path).doc(documentId).get();
    return documentSnapshot.exists;
  }
}
