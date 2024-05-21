import '/flutter_flow/flutter_flow_util.dart';
import 'all_videos_widget.dart' show AllVideosWidget;
import 'package:flutter/material.dart';

class AllVideosModel extends FlutterFlowModel<AllVideosWidget> {
  ///  Local state fields for this page.

  bool showEmailError = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
