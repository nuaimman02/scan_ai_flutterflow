import '/backend/api_requests/api_calls.dart';
import '/components/export_option_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'edit_document_widget.dart' show EditDocumentWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditDocumentModel extends FlutterFlowModel<EditDocumentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - extractFirst500CharactersFromOcr] action in Button widget.
  String? text;
  // Stores action output result for [Backend Call - API (DocumentCatgeorization)] action in Button widget.
  ApiCallResponse? apiResult579;
  // Stores action output result for [Custom Action - generateThumbnailFromFirstPage] action in Button widget.
  FFUploadedFile? thumbnail;
  // Stores action output result for [Custom Action - generateSearchablePdfFromOcr] action in Button widget.
  FFUploadedFile? outputWithOCR;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
