import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/main_pages/meditations_offline/meditations_offline_widget.dart';
import '/profile/is_deleted/is_deleted_widget.dart';
import '/profile/is_downloaded_all/is_downloaded_all_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'meditation_info_new_widget.dart' show MeditationInfoNewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationInfoNewModel extends FlutterFlowModel<MeditationInfoNewWidget> {
  ///  Local state fields for this page.

  bool more = false;

  int iterationIndex = 0;

  int downloadProgress = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveAllBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DownloadAllBtn widget.
  bool? isDownload;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
