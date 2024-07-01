import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'offline_player_page_model.dart';
export 'offline_player_page_model.dart';

class OfflinePlayerPageWidget extends StatefulWidget {
  const OfflinePlayerPageWidget({
    super.key,
    required this.currentAudioIndex,
  });

  final int? currentAudioIndex;

  @override
  State<OfflinePlayerPageWidget> createState() =>
      _OfflinePlayerPageWidgetState();
}

class _OfflinePlayerPageWidgetState extends State<OfflinePlayerPageWidget> {
  late OfflinePlayerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfflinePlayerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'offlinePlayerPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OFFLINE_PLAYER_offlinePlayerPage_ON_INIT');
      logFirebaseEvent('offlinePlayerPage_custom_action');
      await actions.playOrPause(
        'p1',
      );
      logFirebaseEvent('offlinePlayerPage_custom_action');
      await actions.notCreateScreenshots();
      logFirebaseEvent('offlinePlayerPage_update_app_state');
      FFAppState().positionMS = 0;
      setState(() {});
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
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0x983A1537),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 6.0,
                        sigmaY: 6.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'OFFLINE_PLAYER_Container_pff8lb9s_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_navigate_back');
                                      context.pop();
                                    },
                                    child: Container(
                                      width: 44.0,
                                      height: 44.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Icon(
                                          FFIcons.kclose2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 32.0, 20.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context)
                                  .getVariableText(
                                    ruText: FFAppState()
                                        .downloadedTracks[
                                            widget.currentAudioIndex!]
                                        .name,
                                    enText: FFAppState()
                                        .downloadedTracks[
                                            widget.currentAudioIndex!]
                                        .nameEng,
                                  )
                                  .maybeHandleOverflow(
                                    maxChars: 50,
                                    replacement: '…',
                                  ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 8.0, 20.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context)
                                  .getVariableText(
                                    ruText: FFAppState()
                                        .downloadedTracks[
                                            widget.currentAudioIndex!]
                                        .description,
                                    enText: FFAppState()
                                        .downloadedTracks[
                                            widget.currentAudioIndex!]
                                        .descriptionName,
                                  )
                                  .maybeHandleOverflow(
                                    maxChars: 50,
                                    replacement: '…',
                                  ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 48.0, 24.0, 0.0),
                            child: SizedBox(
                              height: 55.0,
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 48.0,
                                    child: custom_widgets.CustomSlider(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
                                      playId: 'p1',
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .buttonColor2,
                                      id: valueOrDefault<String>(
                                        FFAppState()
                                            .downloadedTracks[
                                                widget.currentAudioIndex!]
                                            .id,
                                        '1',
                                      ),
                                      title: valueOrDefault<String>(
                                        FFAppState()
                                            .downloadedTracks[
                                                widget.currentAudioIndex!]
                                            .name,
                                        '1',
                                      ),
                                      duration: 20,
                                      image: FFAppState()
                                          .downloadedTracks[
                                              widget.currentAudioIndex!]
                                          .photo,
                                      audioPath: valueOrDefault<String>(
                                        FFAppState()
                                            .downloadedTracks[
                                                widget.currentAudioIndex!]
                                            .audioPath,
                                        '1',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          functions.formatMilliseconds(
                                              FFAppState().durationMS),
                                          '0:00',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          functions.formatMilliseconds(
                                              FFAppState().positionMS),
                                          '0:00',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 38.0, 0.0, 92.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      FFIcons.kunion23,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OFFLINE_PLAYER_minus15sBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'minus15sBtn_custom_action');
                                      await actions.seekAudio(
                                        'p1',
                                        FFAppState().positionMS - 15000,
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    buttonSize: 48.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      FFIcons.k5,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OFFLINE_PLAYER_PreviousBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'PreviousBtn_navigate_to');

                                      context.goNamed(
                                        'offlinePlayerPage',
                                        queryParameters: {
                                          'currentAudioIndex': serializeParam(
                                            valueOrDefault<int>(
                                              (widget.currentAudioIndex!) - 1,
                                              1,
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: Stack(
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (FFAppState().isAudioPlaying) {
                                              return FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 48.0,
                                                buttonSize: 64.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  FFIcons.k4,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'OFFLINE_PLAYER_PAGE_PAGE_PauseBtn_ON_TAP');
                                                  logFirebaseEvent(
                                                      'PauseBtn_custom_action');
                                                  await actions.playOrPause(
                                                    'p1',
                                                  );
                                                  logFirebaseEvent(
                                                      'PauseBtn_update_app_state');
                                                  FFAppState().isAudioPlaying =
                                                      false;
                                                  setState(() {});
                                                },
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'OFFLINE_PLAYER_Container_fya4e3jm_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_custom_action');
                                                  await actions.playOrPause(
                                                    'p1',
                                                  );
                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().isAudioPlaying =
                                                      true;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: 64.0,
                                                  height: 64.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.play,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    buttonSize: 48.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      FFIcons.k3,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OFFLINE_PLAYER_PAGE_PAGE_NextBtn_ON_TAP');
                                      logFirebaseEvent('NextBtn_navigate_to');

                                      context.goNamed(
                                        'offlinePlayerPage',
                                        queryParameters: {
                                          'currentAudioIndex': serializeParam(
                                            valueOrDefault<int>(
                                              (widget.currentAudioIndex!) + 1,
                                              1,
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      FFIcons.kunion222,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OFFLINE_PLAYER_plus15sBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'plus15sBtn_custom_action');
                                      await actions.seekAudio(
                                        'p1',
                                        FFAppState().positionMS + 30000,
                                      );
                                    },
                                  ),
                                ].divide(const SizedBox(width: 24.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
