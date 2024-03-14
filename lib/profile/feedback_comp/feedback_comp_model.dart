import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_comp_widget.dart' show FeedbackCompWidget;
import 'package:flutter/material.dart';

class FeedbackCompModel extends FlutterFlowModel<FeedbackCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackController;
  String? Function(BuildContext, String?)? feedbackControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedbackFocusNode?.dispose();
    feedbackController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
