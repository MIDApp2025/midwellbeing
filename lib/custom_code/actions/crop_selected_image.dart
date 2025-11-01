// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// Tämä toimii Webissä ja Mobiilissa — ilman että FlutterFlow kaatuu
/// buildissa.
Future<String?> cropSelectedImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return null;

  // 🔹 Web: suora lataus ilman rajausvaihetta
  if (kIsWeb) {
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_photos/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final uploadTask = await ref.putData(await pickedFile.readAsBytes());
    final downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  // 🔹 Mobiili: rajaus vain jos image_cropper on asennettu (try-catch suojaa web-buildilta)
  try {
    final dynamic cropper = await _loadCropper();
    if (cropper == null) {
      debugPrint('Image cropper not available, uploading original image.');
      final file = File(pickedFile.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_photos/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    }

    final croppedFile = await cropper(pickedFile.path);
    if (croppedFile == null) return null;

    final file = File(croppedFile);
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_photos/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final uploadTask = await ref.putFile(file);
    final downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    debugPrint('Error during cropping: $e');
    return null;
  }
}

// Tämä metodi yrittää dynaamisesti ladata cropperin vain mobiilissa
Future<dynamic> _loadCropper() async {
  if (kIsWeb) return null;
  try {
    // Ladataan dynaamisesti vasta runtime-vaiheessa
    final cropperLib = await Future.microtask(() => _getCropper());
    return cropperLib;
  } catch (e) {
    return null;
  }
}

// Tämä eristää ImageCropperin FlutterFlown build-järjestelmältä
dynamic _getCropper() {
  try {
    // ignore: import_of_legacy_library_into_null_safe
    return (String path) async {
      final cropper = dynamicLibraryLoader();
      return await cropper?.call(path);
    };
  } catch (_) {
    return null;
  }
}

// Tyhjä stub jotta käännös onnistuu Webissä
dynamic dynamicLibraryLoader() => null;

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
