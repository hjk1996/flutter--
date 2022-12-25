import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  Future<Map<String, Image>> getUserPhotos(List<String> uids) async {
    final images = <String, Image>{};
    for (final uid in uids) {
      final path = "users/$uid/profile.jpg";
      final url = await getDownloadUrl(path);
      final res = await http.get(Uri.parse(url));
      final image = Image.memory(res.bodyBytes);
      images[uid] = image;
    }
    return images;
  }
}
