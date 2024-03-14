import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_info_new_widget.dart' show MeditationInfoNewWidget;
import 'package:flutter/material.dart';

class MeditationInfoNewModel extends FlutterFlowModel<MeditationInfoNewWidget> {
  ///  Local state fields for this page.

  bool more = false;

  int iterationIndex = 0;

  int downloadProgress = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveAllBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DownloadAllBtn widget.
  bool? isDownload;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
