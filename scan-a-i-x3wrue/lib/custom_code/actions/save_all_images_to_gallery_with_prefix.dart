// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<String>> saveAllImagesToGalleryWithPrefix(
    List<FFUploadedFile> imageFiles, String prefix) async {
  List<String> savedImagePaths = [];
  try {
    // Request storage permission (needed for both Android and iOS)
    var status = await Permission.photos.request();
    if (!status.isGranted) {
      print("Gallery permission denied");
      return [];
    }
    for (int i = 0; i < imageFiles.length; i++) {
      final fileBytes = imageFiles[i].bytes;
      final fileName =
          '${prefix}_${DateTime.now().millisecondsSinceEpoch}_$i.jpg';
      if (fileBytes == null) {
        print('File $i has no bytes, skipping');
        continue;
      }
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(fileBytes),
        name: fileName,
        isReturnImagePathOfIOS: true,
      );
      print('Saving $fileName: $result');
      if (result != null && result['isSuccess'] == true) {
        savedImagePaths.add(result['filePath']);
      } else {
        print("Failed to save image: $fileName");
      }
    }
    return savedImagePaths;
  } catch (e) {
    print("Error saving images to gallery: $e");
    return [];
  }
}
