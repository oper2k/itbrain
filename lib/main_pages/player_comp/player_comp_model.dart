import '/flutter_flow/flutter_flow_util.dart';
import 'player_comp_widget.dart' show PlayerCompWidget;
import 'package:flutter/material.dart';

class PlayerCompModel extends FlutterFlowModel<PlayerCompWidget> {
  ///  Local state fields for this component.

  bool isLiked = false;

  ///  State fields for stateful widgets in this component.

  String currentPageLink = '';
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveTrackBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DonwloadTrackBtn widget.
  bool? isDownload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
