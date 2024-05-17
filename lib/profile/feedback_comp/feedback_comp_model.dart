import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_comp_widget.dart' show FeedbackCompWidget;
import 'package:flutter/material.dart';

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
