import '/flutter_flow/flutter_flow_util.dart';
import 'test_query_cache_widget.dart' show TestQueryCacheWidget;
import 'package:flutter/material.dart';

class TestQueryCacheModel extends FlutterFlowModel<TestQueryCacheWidget> {
  ///  Local state fields for this page.

  bool searchOk = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in testQueryCache widget.
  bool? isIOnline;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
