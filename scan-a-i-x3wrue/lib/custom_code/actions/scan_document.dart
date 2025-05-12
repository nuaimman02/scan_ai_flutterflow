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
import 'package:flutter/services.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';

Future<List<FFUploadedFile>> scanDocument() async {
  if (Platform.isAndroid) {
    try {
      final dynamic result =
          await FlutterDocScanner().getScannedDocumentAsImages(page: 20);
      final String raw = result.toString();
      print('Raw scan output: $raw');
      final RegExp uriRegExp = RegExp(r'file://[^}\],\s]+');
      final matches = uriRegExp.allMatches(raw);
      if (matches.isEmpty) {
        print('No scanned images found.');
        return [];
      }
      final List<String> imagePaths = matches
          .map((m) => Uri.parse(m.group(0)!).toFilePath())
          .toSet()
          .toList();
      final List<FFUploadedFile> uploaded = [];
      for (final path in imagePaths) {
        final file = File(path);
        final bytes = await file.readAsBytes();
        final name = path.split(Platform.pathSeparator).last;
        uploaded.add(FFUploadedFile(
          name: name,
          bytes: bytes,
          height: null,
          width: null,
        ));
      }
      return uploaded;
    } on PlatformException catch (e) {
      print('PlatformException: ${e.message}');
      return [];
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  } else {
    try {
      final List<dynamic>? imagePaths =
          await FlutterDocScanner().getScannedDocumentAsImages(page: 20);
      if (imagePaths == null || imagePaths.isEmpty) {
        print('No scanned images found.');
        return [];
      }
      List<FFUploadedFile> uploadedImages = [];
      for (var path in imagePaths) {
        final file = File(path);
        final bytes = await file.readAsBytes();
        final fileName = path.split('/').last;
        uploadedImages.add(
          FFUploadedFile(
            name: fileName,
            bytes: bytes,
            height: null,
            width: null,
          ),
        );
      }
      return uploadedImages;
    } on PlatformException catch (e) {
      print('PlatformException: ${e.message}');
      return [];
    } catch (e) {
      print('Unexpected errors: $e');
      return [];
    }
  }
}
