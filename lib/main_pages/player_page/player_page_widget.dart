import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/player_comp_new/player_comp_new_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'player_page_model.dart';
export 'player_page_model.dart';

class PlayerPageWidget extends StatefulWidget {
  const PlayerPageWidget({
    super.key,
    required this.audio,
    this.medCategory,
    this.meditation,
  });

  final List<MeditationsRecord>? audio;
  final DocumentReference? medCategory;
  final MeditationCategoriesRecord? meditation;

  @override
  State<PlayerPageWidget> createState() => _PlayerPageWidgetState();
}

class _PlayerPageWidgetState extends State<PlayerPageWidget> {
  late PlayerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'playerPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLAYER_playerPage_ON_INIT_STATE');
      logFirebaseEvent('playerPage_custom_action');
      await actions.notCreateScreenshots();
      logFirebaseEvent('playerPage_custom_action');
      await actions.lockOrientation();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 500),
                fadeOutDuration: const Duration(milliseconds: 500),
                imageUrl: widget.audio![FFAppState().playerIndex].imageCover,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.55,
                fit: BoxFit.cover,
              ),
              wrapWithModel(
                model: _model.playerCompNewModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: PlayerCompNewWidget(
                  meditationList: widget.audio!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
