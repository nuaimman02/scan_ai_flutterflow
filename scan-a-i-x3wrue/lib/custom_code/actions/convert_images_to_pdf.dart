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
import 'dart:io';
import 'package:path_provider/path_provider.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image/image.dart' as img;

Future<FFUploadedFile?> convertImagesToPdf(
    List<FFUploadedFile> images, String fileName) async {
  final pdf = pw.Document();
  for (var file in images) {
    if (file.bytes == null) continue;
    // Decode image to get width/height
    final decodedImage = img.decodeImage(file.bytes!);
    if (decodedImage == null) continue;
    final imageWidth = decodedImage.width.toDouble();
    final imageHeight = decodedImage.height.toDouble();
    final imageProvider = pw.MemoryImage(file.bytes!);
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(imageWidth, imageHeight),
        build: (context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Image(imageProvider, fit: pw.BoxFit.fill),
          );
        },
      ),
    );
  }
  final pdfBytes = await pdf.save();
  return FFUploadedFile(
    name: '$fileName.pdf',
    bytes: Uint8List.fromList(pdfBytes),
  );
}
