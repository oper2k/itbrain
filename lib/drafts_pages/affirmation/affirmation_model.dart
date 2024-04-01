import '/flutter_flow/flutter_flow_util.dart';
import 'affirmation_widget.dart' show AffirmationWidget;
import 'package:flutter/material.dart';

class AffirmationModel extends FlutterFlowModel<AffirmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
