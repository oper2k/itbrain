import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/player_comp/player_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'player_page_model.dart';
export 'player_page_model.dart';

class PlayerPageWidget extends StatefulWidget {
  const PlayerPageWidget({
    super.key,
    required this.audio,
    required this.medCategory,
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
      await actions.stopMusic(
        'p1',
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.png',
              ).image,
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/Mask_group2.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.playerCompModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: PlayerCompWidget(
                    meditationList: widget.audio!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
