import '/flutter_flow/flutter_flow_util.dart';
import 'do_not_use_widget.dart' show DoNotUseWidget;
import 'package:flutter/material.dart';

class DoNotUseModel extends FlutterFlowModel<DoNotUseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
