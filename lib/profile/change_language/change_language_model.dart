import '/flutter_flow/flutter_flow_util.dart';
import 'change_language_widget.dart' show ChangeLanguageWidget;
import 'package:flutter/material.dart';

class ChangeLanguageModel extends FlutterFlowModel<ChangeLanguageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
