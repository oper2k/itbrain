import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'book_timer_widget.dart' show BookTimerWidget;
import 'package:flutter/material.dart';

class BookTimerModel extends FlutterFlowModel<BookTimerWidget> {
  ///  Local state fields for this page.

  double progress = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }
}
