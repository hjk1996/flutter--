import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelper {
  Future<String> uploadFile(String path, File file) async {
    final ref = FirebaseStorage.instance.ref(path);
    final task = ref.putFile(file);
    final snapshot = await task.whenComplete(() {});
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  Future<void> deleteFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    await ref.delete();
  }

  Future<String> getDownloadUrl(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final url = await ref.getDownloadURL();
    return url;
  }
}
