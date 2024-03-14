import '/flutter_flow/flutter_flow_util.dart';
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:flutter/material.dart';

class PlayerPageModel extends FlutterFlowModel<PlayerPageWidget> {
  ///  Local state fields for this page.

  bool isAudioLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveTrackBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DonwloadTrackBtn widget.
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
