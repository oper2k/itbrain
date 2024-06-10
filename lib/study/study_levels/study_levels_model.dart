import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/study/level_not_avaliable/level_not_avaliable_widget.dart';
import '/study/progress_bar/progress_bar_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'study_levels_widget.dart' show StudyLevelsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyLevelsModel extends FlutterFlowModel<StudyLevelsWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  bool more = false;

  int? downloadProgress = 0;

  bool isPreviusPurchased = false;

  bool isPreviusCompleted = false;

  String? previusLevelTitle;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
