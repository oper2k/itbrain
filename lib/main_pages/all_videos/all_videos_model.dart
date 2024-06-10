import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/study/video_comp/video_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'all_videos_widget.dart' show AllVideosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllVideosModel extends FlutterFlowModel<AllVideosWidget> {
  ///  Local state fields for this page.

  bool showEmailError = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
