import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? capitalizeFirstLetter(String? text) {
  if (text == null || text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

double multiplyByHundred(double num) {
  return num * 100;
}

List<String> parseJsonArrayString(String content) {
  // Clean up the string (in case it has extra whitespace or newlines)
  String cleaned = content.trim();

  // Decode the JSON array string into a List<dynamic>
  List<dynamic> decoded = jsonDecode(cleaned);

  // Cast it to List<String>
  return decoded.cast<String>();
}
