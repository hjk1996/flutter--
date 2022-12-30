import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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

  Future<Map<String, Image?>> getUserPhotos(List<String> uids) async {
    final images = <String, Image?>{};
    for (final uid in uids) {
      final path = "users/$uid/profile.jpg";

      try {
        final url = await getDownloadUrl(path);
        final res = await http.get(Uri.parse(url));
        final image = Image.memory(res.bodyBytes);
        images[uid] = image;
      } catch (e) {
        images[uid] = null;
      }
    }
    return images;
  }

  Future<void> updateUserPhoto(Uint8List photo) async {
    // save uint8list to temporary path and then upload it to firebase storage
    final tempPath = await getTemporaryDirectory();
    final tempFile = File("${tempPath.path}/profile.jpg");
    await tempFile.writeAsBytes(photo);
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final ref = FirebaseStorage.instance.ref("users/$uid/profile.jpg");
    final task = ref.putFile(tempFile);
    final snapshot = await task.whenComplete(() {});
    final url = await snapshot.ref.getDownloadURL();
    await user.updatePhotoURL(url);
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "photoUrl": url,
    });
  }

  Future<void> deleteUserPhoto() async {
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    final path = "users/$uid/profile.jpg";
    await deleteFile(path);
    await user.updatePhotoURL(null);
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "photoUrl": null,
    });
  }
}
