import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/player_comp/player_comp_widget.dart';
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:flutter/material.dart';

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
