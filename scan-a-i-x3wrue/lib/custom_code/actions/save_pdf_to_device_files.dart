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
import 'package:share_plus/share_plus.dart';
import 'index.dart'; // Imports other custom actions
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

Future<String?> savePdfToDeviceFiles(
    FFUploadedFile pdfFile, String newFileName) async {
  try {
    if (Platform.isAndroid) {
      // For Android, save directly to Downloads folder
      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        print('Failed to get external storage directory');
        return null;
      }
      final downloadDir = Directory('/storage/emulated/0/Download');
      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }
      final filePath = '${downloadDir.path}/$newFileName';
      final newPdfFile = File(filePath);
      // Determine source bytes
      Uint8List? bytes = pdfFile.bytes;
      if (bytes == null) {
        throw Exception("No bytes found in pdfFile.");
      }
      await newPdfFile.writeAsBytes(bytes);
      return filePath;
    } else if (Platform.isIOS) {
      try {
        if (pdfFile.bytes == null || pdfFile.bytes!.isEmpty) {
          print('Error: PDF bytes are null or empty.');
          return null;
        }
        final tempDir = await getApplicationDocumentsDirectory();
        final tempFilePath = '${tempDir.path}/$newFileName';
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
    } else {
      print('Unsupported platform');
      return null;
    }
  } on PlatformException catch (e) {
    print('PlatformException while saving PDF: ${e.message}');
    return null;
  } catch (e) {
    print('Unexpected error while saving PDF: $e');
    return null;
  }
}
