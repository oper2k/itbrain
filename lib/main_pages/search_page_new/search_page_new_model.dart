import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import 'search_page_new_widget.dart' show SearchPageNewWidget;
import 'package:flutter/material.dart';

class SearchPageNewModel extends FlutterFlowModel<SearchPageNewWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool? searchOk = false;

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
}
