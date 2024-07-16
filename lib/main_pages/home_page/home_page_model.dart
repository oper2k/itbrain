import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditation_comp/meditation_comp_widget.dart';
import '/navbar/navbar_home/navbar_home_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool searchOk = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<AffirmationRecord>? affirmationRandomRef;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  AffirmationRecord? affirmationRandom;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  AffirmationRecord? affirmationShow;
  // Stores action output result for [Custom Action - checkInternetConnection] action in HomePage widget.
  bool? isIOnline;
  // Models for meditationComp dynamic component.
  late FlutterFlowDynamicModels<MeditationCompModel> meditationCompModels;
  // Model for navbarHome component.
  late NavbarHomeModel navbarHomeModel;

  @override
  void initState(BuildContext context) {
    meditationCompModels =
        FlutterFlowDynamicModels(() => MeditationCompModel());
    navbarHomeModel = createModel(context, () => NavbarHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    meditationCompModels.dispose();
    navbarHomeModel.dispose();
  }
}
