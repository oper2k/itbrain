import '/flutter_flow/flutter_flow_util.dart';
import 'offline_player_page_widget.dart' show OfflinePlayerPageWidget;
import 'package:flutter/material.dart';

class OfflinePlayerPageModel extends FlutterFlowModel<OfflinePlayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
