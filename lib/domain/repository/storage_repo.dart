import 'dart:io';

abstract class FirebaseStorageRepo {
  Future<String> uploadFile(String path, File file);
  Future<String> getDownloadUrl(String path);
}
