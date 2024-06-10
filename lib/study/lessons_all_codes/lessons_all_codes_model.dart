import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lessons_all_codes_widget.dart' show LessonsAllCodesWidget;
import 'package:flutter/material.dart';

class LessonsAllCodesModel extends FlutterFlowModel<LessonsAllCodesWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool more = false;

  int? downloadProgress = 0;

  bool isPushOn = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - convertLessonsListToMeditationsList] action in lessonAudio widget.
  List<MeditationsRecord>? meditations;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
