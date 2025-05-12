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
import 'index.dart'; // Imports other custom actions
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sharePdfFromFFUploadedFile(
    FFUploadedFile pdfFile, String fileName) async {
  try {
    if (pdfFile.bytes == null || pdfFile.bytes!.isEmpty) {
      print('Error: PDF bytes are null or empty.');
      return;
    }
    final tempDir = await getApplicationDocumentsDirectory();
    final tempFilePath = '${tempDir.path}/$fileName';
    print('Temp directory path: ${tempDir.path}');
    final tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(pdfFile.bytes!);
    // Provide a default centered Rect for iPad
    final fallbackOrigin =
        Rect.fromLTWH(400, 400, 100, 100); // adjust if needed
    await Share.shareXFiles(
      [XFile(tempFile.path)],
      sharePositionOrigin: fallbackOrigin,
    );
  } catch (e) {
    print('Error while sharing PDF: $e');
  }
}
