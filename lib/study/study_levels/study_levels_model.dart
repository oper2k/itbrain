import '/flutter_flow/flutter_flow_util.dart';
import 'study_levels_widget.dart' show StudyLevelsWidget;
import 'package:flutter/material.dart';

class StudyLevelsModel extends FlutterFlowModel<StudyLevelsWidget> {
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
