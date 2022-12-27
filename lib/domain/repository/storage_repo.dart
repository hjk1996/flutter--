import 'dart:io';

import 'package:flutter/material.dart';

abstract class FirebaseStorageRepo {
  Future<String> uploadFile(String path, File file);
  Future<String> getDownloadUrl(String path);
  Future<void> deleteFile(String path);
  Future<Map<String, Image?>> getUserPhotos(List<String> uids);
}
