import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/confirmed_feedback/confirmed_feedback_widget.dart';
import 'feedback_comp_widget.dart' show FeedbackCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackCompModel extends FlutterFlowModel<FeedbackCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackTextController;
  String? Function(BuildContext, String?)? feedbackTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedbackFocusNode?.dispose();
    feedbackTextController?.dispose();
  }
}
