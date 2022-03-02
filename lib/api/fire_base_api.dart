import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destinationPath, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destinationPath);
      return ref.putFile(file);
    }on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destinationPath, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destinationPath);
      return ref.putData(data);
    }on FirebaseException catch (e) {
      return null;
    }
  }
}
