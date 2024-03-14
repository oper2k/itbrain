import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  bool searchOk = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<MeditationsRecord> simpleSearchResults = [];
  // Models for meditations dynamic component.
  late FlutterFlowDynamicModels<MeditationsModel> meditationsModels1;
  // Models for meditations dynamic component.
  late FlutterFlowDynamicModels<MeditationsModel> meditationsModels2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    meditationsModels1 = FlutterFlowDynamicModels(() => MeditationsModel());
    meditationsModels2 = FlutterFlowDynamicModels(() => MeditationsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    meditationsModels1.dispose();
    meditationsModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
