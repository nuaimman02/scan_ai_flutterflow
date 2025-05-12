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
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart' show Image;

Future<String?> extractFirst500CharactersFromOcr(
    List<FFUploadedFile> imageFiles) async {
  try {
    String extractedText = '';
    for (var image in imageFiles) {
      final tempDir = await getTemporaryDirectory();
      final imagePath = '${tempDir.path}/${image.name}';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(image.bytes!);
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final recognizedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();
      for (final block in recognizedText.blocks) {
        for (final line in block.lines) {
          for (final element in line.elements) {
            extractedText += element.text;
          }
        }
      }
      if (extractedText.length >= 500) {
        extractedText = extractedText.substring(0, 500);
        break;
      }
    }
    return extractedText.isNotEmpty ? extractedText : null;
  } catch (e, stack) {
    print('❌ Error extracting OCR text: $e\n$stack');
    return null;
  }
}
