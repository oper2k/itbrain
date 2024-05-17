import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_info_widget.dart' show MeditationInfoWidget;
import 'package:flutter/material.dart';

class MeditationInfoModel extends FlutterFlowModel<MeditationInfoWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool more = false;

  int? downloadProgress = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveAllBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DownloadAllBtn widget.
  bool? isDownload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
