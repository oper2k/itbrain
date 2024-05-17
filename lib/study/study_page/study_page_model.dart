import '/flutter_flow/flutter_flow_util.dart';
import '/navbar/navbar_study/navbar_study_widget.dart';
import 'study_page_widget.dart' show StudyPageWidget;
import 'package:flutter/material.dart';

class StudyPageModel extends FlutterFlowModel<StudyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarStudy component.
  late NavbarStudyModel navbarStudyModel;

  @override
  void initState(BuildContext context) {
    navbarStudyModel = createModel(context, () => NavbarStudyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarStudyModel.dispose();
  }
}
