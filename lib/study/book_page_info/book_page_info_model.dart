import '/flutter_flow/flutter_flow_util.dart';
import 'book_page_info_widget.dart' show BookPageInfoWidget;
import 'package:flutter/material.dart';

class BookPageInfoModel extends FlutterFlowModel<BookPageInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
