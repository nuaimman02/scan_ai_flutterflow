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
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart' show Image;

Future<FFUploadedFile?> generateSearchablePdfFromOcr(
    List<FFUploadedFile> imageFiles, String outputFileName) async {
  try {
    final tempDir = await getTemporaryDirectory();
    final pdf = pw.Document();
    for (var image in imageFiles) {
      final imagePath = '${tempDir.path}/${image.name}';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(image.bytes!);
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final recognizedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();
      final decodedImage = await decodeImageFromList(image.bytes!);
      final imageWidth = decodedImage.width.toDouble();
      final imageHeight = decodedImage.height.toDouble();
      final imageProvider = pw.MemoryImage(image.bytes!);
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(imageWidth, imageHeight),
          build: (pw.Context context) {
            return pw.Stack(
              children: [
                pw.Positioned.fill(
                  child: pw.Image(imageProvider, fit: pw.BoxFit.fill),
                ),
                for (final block in recognizedText.blocks)
                  for (final line in block.lines)
                    for (final element in line.elements)
                      pw.Positioned(
                        left: element.boundingBox.left.toDouble(),
                        top: element.boundingBox.top.toDouble(),
                        child: pw.Opacity(
                          opacity: 0.0,
                          child: pw.Text(
                            element.text,
                            style: pw.TextStyle(
                              fontSize:
                                  element.boundingBox.height.toDouble() * 0.9,
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      );
    }
    final pdfBytes = await pdf.save();
    return FFUploadedFile(name: outputFileName, bytes: pdfBytes);
  } catch (e, stack) {
    print('❌ Error generating OCR searchable PDF: $e\n$stack');
    return null;
  }
}
