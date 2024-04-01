import '/flutter_flow/flutter_flow_util.dart';
import 'buy_pack_widget.dart' show BuyPackWidget;
import 'package:flutter/material.dart';

class BuyPackModel extends FlutterFlowModel<BuyPackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
