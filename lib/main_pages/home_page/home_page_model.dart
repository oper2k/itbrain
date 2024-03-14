import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/meditation_comp/meditation_comp_widget.dart';
import '/main_pages/offline_mode/offline_mode_widget.dart';
import '/profile/affirmation_comp/affirmation_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool searchOk = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in HomePage widget.
  bool? isIOnline;
  // Models for meditationComp dynamic component.
  late FlutterFlowDynamicModels<MeditationCompModel> meditationCompModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    meditationCompModels =
        FlutterFlowDynamicModels(() => MeditationCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    meditationCompModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
