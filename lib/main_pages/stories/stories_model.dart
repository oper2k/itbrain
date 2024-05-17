import '/flutter_flow/flutter_flow_util.dart';
import 'stories_widget.dart' show StoriesWidget;
import 'package:flutter/material.dart';

class StoriesModel extends FlutterFlowModel<StoriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
