import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storae_service.dart';

class FireStorage implements StoraeService {
  @override
  final storageReference = FirebaseStorage.instance;
  Future<String> uploadImage(String path) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
