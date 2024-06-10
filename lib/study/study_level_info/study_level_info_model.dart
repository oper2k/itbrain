import '/flutter_flow/flutter_flow_util.dart';
import 'study_level_info_widget.dart' show StudyLevelInfoWidget;
import 'package:flutter/material.dart';

class StudyLevelInfoModel extends FlutterFlowModel<StudyLevelInfoWidget> {
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
