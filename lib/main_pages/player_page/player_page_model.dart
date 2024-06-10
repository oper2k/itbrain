import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/player_comp/player_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerPageModel extends FlutterFlowModel<PlayerPageWidget> {
  ///  Local state fields for this page.

  bool isAudioLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for playerComp component.
  late PlayerCompModel playerCompModel;

  @override
  void initState(BuildContext context) {
    playerCompModel = createModel(context, () => PlayerCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    playerCompModel.dispose();
  }
}
