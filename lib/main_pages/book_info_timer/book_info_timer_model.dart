import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'book_info_timer_widget.dart' show BookInfoTimerWidget;
import 'package:flutter/material.dart';

class BookInfoTimerModel extends FlutterFlowModel<BookInfoTimerWidget> {
  ///  Local state fields for this component.

  double progress = 0.0;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in bookInfoTimer widget.
  List<BooksPagesRecord>? allPages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
