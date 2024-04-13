import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_page_new_widget.dart' show SearchPageNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchPageNewModel extends FlutterFlowModel<SearchPageNewWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool? searchOk = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<MeditationsRecord> simpleSearchResults = [];
  // Models for meditations dynamic component.
  late FlutterFlowDynamicModels<MeditationsModel> meditationsModels1;
  // Models for meditations dynamic component.
  late FlutterFlowDynamicModels<MeditationsModel> meditationsModels2;

  @override
  void initState(BuildContext context) {
    meditationsModels1 = FlutterFlowDynamicModels(() => MeditationsModel());
    meditationsModels2 = FlutterFlowDynamicModels(() => MeditationsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    meditationsModels1.dispose();
    meditationsModels2.dispose();
  }
}
