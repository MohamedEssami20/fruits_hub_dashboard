import 'dart:developer';
import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;
import '../utils/backend_endpoints.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static Future<void> createBucket(String bucketName) async {
    BucketOptions bucketOptions = const BucketOptions(public: true);
    List<Bucket> bucketList = await _supabase.client.storage.listBuckets();
    bool isbucketExits = false;
    for (var bucket in bucketList) {
      if (bucket.id == bucketName) {
        isbucketExits = true;
        break;
      }
    }
    if (!isbucketExits) {
      await _supabase.client.storage.createBucket(
        bucketName,
        bucketOptions,
      );
    }
  }

  static Future<void> initSupabaseService() async {
    _supabase = await Supabase.initialize(
      url: BackendEndpoints.supabaseProjectUrl,
      anonKey: BackendEndpoints.supabasseProjectApoKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basename(file.path);
    String fileExetension = p.extension(file.path);
    String result = await _supabase.client.storage
        .from("fruitsimages")
        .upload("$path/$fileName.$fileExetension", file);
    log("image url in storage service= $result");
    return result;
  }
}
