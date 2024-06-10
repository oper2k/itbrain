import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbar/navbar_study/navbar_study_widget.dart';
import '/study/study_comp/study_comp_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'study_page_widget.dart' show StudyPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
