import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'process_name_card_widget.dart' show ProcessNameCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProcessNameCardModel extends FlutterFlowModel<ProcessNameCardWidget> {
  ///  Local state fields for this page.

  String fullName = '-';

  String jobTitle = '-';

  String companyName = '-';

  String phone = '-';

  String email = '-';

  bool isRetrieving = true;

  double? progress = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - extractBusinessCardText] action in ProcessNameCard widget.
  String? ocrText;
  // Stores action output result for [Backend Call - API (ExtractNameCard)] action in ProcessNameCard widget.
  ApiCallResponse? apiResultd4u;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
