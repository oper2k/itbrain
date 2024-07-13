import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/player_comp_new/player_comp_new_widget.dart';
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:flutter/material.dart';

class PlayerPageModel extends FlutterFlowModel<PlayerPageWidget> {
  ///  Local state fields for this page.

  bool isAudioLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for playerCompNew component.
  late PlayerCompNewModel playerCompNewModel;

  @override
  void initState(BuildContext context) {
    playerCompNewModel = createModel(context, () => PlayerCompNewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    playerCompNewModel.dispose();
  }
}
