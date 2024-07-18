import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditation_player_info/meditation_player_info_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'player_comp_new_model.dart';
export 'player_comp_new_model.dart';

class PlayerCompNewWidget extends StatefulWidget {
  const PlayerCompNewWidget({
    super.key,
    required this.meditationList,
  });

  final List<MeditationsRecord>? meditationList;

  @override
  State<PlayerCompNewWidget> createState() => _PlayerCompNewWidgetState();
}

class _PlayerCompNewWidgetState extends State<PlayerCompNewWidget> {
  late PlayerCompNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerCompNewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLAYER_NEW_playerCompNew_ON_INIT_STATE');
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.5,
        constraints: const BoxConstraints(
          minHeight: 365.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF370C59),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          border: Border.all(
            color: const Color(0x32FFFFFF),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('PLAYER_NEW_Container_bhsbfzzr_ON_TAP');
                      logFirebaseEvent('Container_custom_action');
                      await actions.stopMusic(
                        'p1',
                      );
                      logFirebaseEvent('Container_navigate_back');
                      context.safePop();
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Icon(
                          FFIcons.kclose2,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  if ((FFLocalizations.of(context).getVariableText(
                                ruText: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .playerTitle,
                                enText: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .playerTitleEng,
                              ) !=
                              '') &&
                      (FFLocalizations.of(context).getVariableText(
                                ruText: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .playerText,
                                enText: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .playerTextEng,
                              ) !=
                              ''))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PLAYER_COMP_NEW_COMP_Row_ikc2b9vd_ON_TAP');
                        logFirebaseEvent('Row_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: MeditationPlayerInfoWidget(
                                playerInfo: widget.meditationList!,
                                index: FFAppState().playerIndex,
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '35qod6zb' /* Описание */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.2,
                                ),
                          ),
                          Icon(
                            FFIcons.k9,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24.0,
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
                    ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ),
            const Spacer(flex: 3),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget.meditationList?[FFAppState().playerIndex].title,
                  '0',
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                      lineHeight: 1.2,
                    ),
              ),
            ),
            if (widget.meditationList?[FFAppState().playerIndex]
                        .description !=
                    null &&
                widget.meditationList?[FFAppState().playerIndex]
                        .description !=
                    '')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                child: AutoSizeText(
                  valueOrDefault<String>(
                    widget
                        .meditationList?[FFAppState().playerIndex].description,
                    '0',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Evolventa',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.2,
                      ),
                ),
              ),
            const Spacer(flex: 4),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 158.0,
                      child: custom_widgets.NewPlayerCopy(
                        width: double.infinity,
                        height: 158.0,
                        url: functions.audioPathToString(widget
                            .meditationList?[FFAppState().playerIndex]
                            .audioPath),
                        ksecBack: Icon(
                          FFIcons.k5,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        ksecForward: Icon(
                          FFIcons.k3,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        kplay: Icon(
                          FFIcons.kplayyy,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 36.0,
                        ),
                        kpause: Icon(
                          FFIcons.k4,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        kRepeatOn: Icon(
                          FFIcons.knotHeart45,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                        kRepeatOff: Icon(
                          FFIcons.krotationing,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                        primaryColor: FlutterFlowTheme.of(context).primaryText,
                        secondaryColor: const Color(0x67471F66),
                        notificationImagePath: widget
                            .meditationList![FFAppState().playerIndex].image,
                        notificationTitle: widget
                            .meditationList![FFAppState().playerIndex].title,
                        notificationAlbum: widget
                            .meditationList![FFAppState().playerIndex].title,
                        bufferingColor:
                            FlutterFlowTheme.of(context).buttonColor,
                        showRepeatButton: true,
                        showSpeedButton: true,
                        playSize: 36.0,
                        playAction: () async {},
                        oneMinuteAction: () async {},
                        backAction: () async {
                          logFirebaseEvent(
                              'PLAYER_NEW_Container_e6o0m3cf_CALLBACK');
                          if (FFAppState().playerIndex > 0) {
                            logFirebaseEvent('NewPlayerCopy_update_app_state');
                            FFAppState().positionMS = 0;
                            FFAppState().playerIndex =
                                FFAppState().playerIndex + -1;
                            FFAppState().isAudioPlaying = true;
                            setState(() {});
                            logFirebaseEvent('NewPlayerCopy_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'playerPage',
                              queryParameters: {
                                'audio': serializeParam(
                                  widget.meditationList,
                                  ParamType.Document,
                                  isList: true,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'audio': widget.meditationList,
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            return;
                          } else {
                            return;
                          }
                        },
                        forwardAction: () async {
                          logFirebaseEvent(
                              'PLAYER_NEW_Container_e6o0m3cf_CALLBACK');
                          logFirebaseEvent('NewPlayerCopy_update_app_state');
                          FFAppState().positionMS = 0;
                          FFAppState().playerIndex =
                              FFAppState().playerIndex + 1;
                          FFAppState().isAudioPlaying = true;
                          logFirebaseEvent('NewPlayerCopy_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'playerPage',
                            queryParameters: {
                              'audio': serializeParam(
                                widget.meditationList,
                                ParamType.Document,
                                isList: true,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'audio': widget.meditationList,
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 6),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 44.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PLAYER_NEW_Container_jpvbrxb1_ON_TAP');
                              logFirebaseEvent('Container_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      ruText: 'Формируем ссылку, подождите',
                                      enText:
                                          'We are generating a link, please wait',
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Evolventa',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).buttonColor,
                                ),
                              );
                              logFirebaseEvent(
                                  'Container_generate_current_page_link');
                              _model.currentPageLink =
                                  await generateCurrentPageLink(
                                context,
                                title: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .title,
                                imageUrl: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .image,
                                description: widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .description,
                              );

                              logFirebaseEvent('Container_share');
                              await Share.share(
                                _model.currentPageLink,
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  FFIcons.kshare2,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: 36.0,
                              height: 36.0,
                              child: custom_widgets.DownloadWidget(
                                width: 36.0,
                                height: 36.0,
                                url: functions.audioPathToString(widget
                                    .meditationList?[FFAppState().playerIndex]
                                    .audioPath)!,
                                downloadOn: Icon(
                                  FFIcons.k6,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                                downloadOff: Icon(
                                  FFIcons.kcloudUpload,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                                colorPrimary:
                                    FlutterFlowTheme.of(context).primary,
                                colorSecondary: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                finishDownload: () async {
                                  logFirebaseEvent(
                                      'PLAYER_NEW_Container_sgixco1s_CALLBACK');
                                  logFirebaseEvent(
                                      'DownloadWidget_update_app_state');
                                  FFAppState().updateDownloadedTracksAtIndex(
                                    valueOrDefault<int>(
                                          FFAppState().downloadedTracks.length,
                                          1,
                                        ) -
                                        1,
                                    (e) => e
                                      ..name = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .title
                                      ..description = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .description
                                      ..audioPath = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .audioPath
                                      ..isPaid = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .isPaid
                                      ..duration = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .duration
                                      ..type = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .type
                                      ..nameEng = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .titleEng
                                      ..descriptionName = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .descriptionEng
                                      ..durationEng = widget
                                          .meditationList?[
                                              FFAppState().playerIndex]
                                          .durationEng,
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            if ((currentUserDocument?.meditationsWishList
                                            .toList() ??
                                        [])
                                    .contains(widget
                                        .meditationList?[
                                            FFAppState().playerIndex]
                                        .reference) ||
                                _model.isLiked) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PLAYER_NEW_Container_8exr2rmc_ON_TAP');
                                  logFirebaseEvent('Container_backend_call');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'meditationsWishList':
                                            FieldValue.arrayRemove([
                                          widget
                                              .meditationList?[
                                                  FFAppState().playerIndex]
                                              .reference
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.isLiked = false;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: const BoxDecoration(),
                                  child: const Icon(
                                    FFIcons.kheart2,
                                    color: Colors.white,
                                    size: 32.0,
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PLAYER_NEW_Container_2tvak2qa_ON_TAP');
                                  logFirebaseEvent('Container_backend_call');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'meditationsWishList':
                                            FieldValue.arrayUnion([
                                          widget
                                              .meditationList?[
                                                  FFAppState().playerIndex]
                                              .reference
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.isLiked = true;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: const BoxDecoration(),
                                  child: const Icon(
                                    FFIcons.k8,
                                    color: Colors.white,
                                    size: 32.0,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ].divide(const SizedBox(width: 48.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
