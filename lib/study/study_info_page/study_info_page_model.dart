import '/flutter_flow/flutter_flow_util.dart';
import 'study_info_page_widget.dart' show StudyInfoPageWidget;
import 'package:flutter/material.dart';

class StudyInfoPageModel extends FlutterFlowModel<StudyInfoPageWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool more = false;

  int? downloadProgress = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
