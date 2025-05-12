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
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'index.dart'; // Imports other custom actions

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<void> shareContactAsVCard(String fullName, String jobTitle,
    String companyName, String phone, String email) async {
  // Create vCard format string
  final vCard = '''
BEGIN:VCARD
VERSION:3.0
FN:$fullName
ORG:$companyName
TITLE:$jobTitle
TEL;TYPE=CELL:$phone
EMAIL;TYPE=INTERNET:$email
END:VCARD
''';
  try {
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/$fullName.vcf';
    final file = File(path);
    await file.writeAsString(vCard);
    final fallbackOrigin = Rect.fromLTWH(400, 400, 100, 100);
    await Share.shareXFiles(
      [XFile(file.path)],
      sharePositionOrigin: fallbackOrigin,
    );
    print('vCard for $fullName shared successfully.');
  } catch (e) {
    print('Failed to share vCard: $e');
  }
}
