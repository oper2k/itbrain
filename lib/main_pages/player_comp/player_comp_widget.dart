import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/is_deleted_once/is_deleted_once_widget.dart';
import '/profile/is_downloaded_once/is_downloaded_once_widget.dart';
import '/profile/is_not_downloaded/is_not_downloaded_widget.dart';
import '/profile/meditation_player_info/meditation_player_info_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'player_comp_model.dart';
export 'player_comp_model.dart';

class PlayerCompWidget extends StatefulWidget {
  const PlayerCompWidget({
    super.key,
    required this.meditationList,
  });

  final List<MeditationsRecord>? meditationList;

  @override
  State<PlayerCompWidget> createState() => _PlayerCompWidgetState();
}

class _PlayerCompWidgetState extends State<PlayerCompWidget> {
  late PlayerCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.playOrPause(
        'p1',
      );
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
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
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
                          await actions.stopMusic(
                            'p1',
                          );
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
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
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
                                'rj969l7a' /* Описание */,
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
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getVariableText(
                      ruText: widget
                          .meditationList?[FFAppState().playerIndex].title,
                      enText: widget
                          .meditationList?[FFAppState().playerIndex].titleEng,
                    ),
                    textAlign: TextAlign.center,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getVariableText(
                      ruText: widget.meditationList?[FFAppState().playerIndex]
                          .description,
                      enText: widget.meditationList?[FFAppState().playerIndex]
                          .descriptionEng,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.2,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 0.0),
                  child: SizedBox(
                    height: 55.0,
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            child: custom_widgets.CustomSlider(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              playId: 'p1',
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveColor:
                                  FlutterFlowTheme.of(context).buttonColor2,
                              id: widget
                                  .meditationList?[FFAppState().playerIndex]
                                  .reference
                                  .id,
                              title: widget
                                  .meditationList?[FFAppState().playerIndex]
                                  .title,
                              duration: 20,
                              image: widget
                                  .meditationList?[FFAppState().playerIndex]
                                  .image,
                              audioPath: widget
                                  .meditationList?[FFAppState().playerIndex]
                                  .audioPath,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions
                                  .formatMilliseconds(FFAppState().durationMS),
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions
                                  .formatMilliseconds(FFAppState().positionMS),
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 64.0),
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
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
                            color: FFAppState().playerIndex > 0
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().playerIndex > 0) {
                              FFAppState().positionMS = 0;
                              FFAppState().playerIndex =
                                  FFAppState().playerIndex + -1;
                              FFAppState().isAudioPlaying = true;
                              await actions.createDataType(
                                widget
                                    .meditationList?[FFAppState().playerIndex],
                              );
                              await actions.playMusic(
                                'p1',
                                widget.meditationList![FFAppState().playerIndex]
                                    .audioPath,
                              );
                              setState(() {});
                              return;
                            } else {
                              return;
                            }
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
                                    return Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 48.0,
                                        buttonSize: 64.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          FFIcons.k4,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await actions.playOrPause(
                                            'p1',
                                          );
                                          setState(() {
                                            FFAppState().isAudioPlaying = false;
                                          });
                                        },
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await actions.playOrPause(
                                          'p1',
                                        );
                                        setState(() {
                                          FFAppState().isAudioPlaying = true;
                                        });
                                      },
                                      child: Container(
                                        width: 64.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.play,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                        Builder(
                          builder: (context) {
                            if ((FFAppState().playerIndex <
                                    (widget.meditationList!.length - 1)) &&
                                (!widget
                                        .meditationList![
                                            FFAppState().playerIndex + 1]
                                        .isPaid ||
                                    (currentUserDocument
                                                ?.purchasedMeditationsPacks
                                                .toList() ??
                                            [])
                                        .contains(widget
                                            .meditationList?[
                                                FFAppState().playerIndex]
                                            .meditationCategory))) {
                              return FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                buttonSize: 48.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  FFIcons.k3,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  FFAppState().positionMS = 0;
                                  FFAppState().playerIndex =
                                      FFAppState().playerIndex + 1;
                                  FFAppState().isAudioPlaying = true;
                                  await actions.createDataType(
                                    widget.meditationList?[
                                        FFAppState().playerIndex],
                                  );
                                  await actions.playMusic(
                                    'p1',
                                    widget
                                        .meditationList![
                                            FFAppState().playerIndex]
                                        .audioPath,
                                  );
                                  setState(() {});
                                },
                              );
                            } else {
                              return FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                buttonSize: 48.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  FFIcons.k3,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('NextBtn pressed ...');
                                },
                              );
                            }
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 48.0,
                          icon: Icon(
                            FFIcons.kunion222,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 44.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
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
                                child: Icon(
                                  FFIcons.kshare2,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              if (functions.findTrackById(
                                      widget
                                          .meditationList![
                                              FFAppState().playerIndex]
                                          .reference
                                          .id,
                                      FFAppState()
                                          .downloadingTracks
                                          .toList()) !=
                                  null)
                                SizedBox(
                                  width: 32.0,
                                  height: 32.0,
                                  child: custom_widgets.CustomProgressBar(
                                    width: 32.0,
                                    height: 32.0,
                                    track: functions.findTrackById(
                                        widget
                                            .meditationList![
                                                FFAppState().playerIndex]
                                            .reference
                                            .id,
                                        FFAppState()
                                            .downloadingTracks
                                            .toList()),
                                  ),
                                ),
                              Builder(
                                builder: (context) {
                                  if (functions.findTrackById(
                                          widget
                                              .meditationList![
                                                  FFAppState().playerIndex]
                                              .reference
                                              .id,
                                          FFAppState()
                                              .downloadedTracks
                                              .toList()) !=
                                      null) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isDeleted =
                                            await actions.deleteFiles(
                                          functions.findTrackById(
                                              widget
                                                  .meditationList![
                                                      FFAppState().playerIndex]
                                                  .reference
                                                  .id,
                                              FFAppState()
                                                  .downloadedTracks
                                                  .toList()),
                                        );
                                        if (_model.isDeleted!) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const IsDeletedOnceWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }

                                        setState(() {});
                                      },
                                      child: Icon(
                                        FFIcons.kcloudUpload,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (!(functions.findTrackById(
                                                widget
                                                    .meditationList![
                                                        FFAppState()
                                                            .playerIndex]
                                                    .reference
                                                    .id,
                                                FFAppState()
                                                    .downloadingTracks
                                                    .toList()) !=
                                            null)) {
                                          _model.isDownload =
                                              await actions.downloadUrl(
                                            widget
                                                .meditationList?[
                                                    FFAppState().playerIndex]
                                                .reference
                                                .id,
                                            widget
                                                .meditationList?[
                                                    FFAppState().playerIndex]
                                                .audioPath,
                                            widget
                                                .meditationList?[
                                                    FFAppState().playerIndex]
                                                .image,
                                          );
                                        }
                                        if (_model.isDownload!) {
                                          setState(() {
                                            FFAppState()
                                                .updateDownloadedTracksAtIndex(
                                              valueOrDefault<int>(
                                                    FFAppState()
                                                        .downloadedTracks
                                                        .length,
                                                    1,
                                                  ) -
                                                  1,
                                              (e) => e
                                                ..name = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .title
                                                ..description = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .description
                                                ..audioPath = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .audioPath
                                                ..isPaid = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .isPaid
                                                ..duration = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .duration
                                                ..type = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .type
                                                ..nameEng = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .titleEng
                                                ..descriptionName = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .descriptionEng
                                                ..durationEng = widget
                                                    .meditationList?[
                                                        FFAppState()
                                                            .playerIndex]
                                                    .durationEng,
                                            );
                                          });
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const IsDownloadedOnceWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const IsNotDownloadedWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }

                                        setState(() {});
                                      },
                                      child: const Icon(
                                        FFIcons.kshare3,
                                        color: Colors.white,
                                        size: 32.0,
                                      ),
                                    );
                                  }
                                },
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
                                    setState(() {
                                      _model.isLiked = false;
                                    });
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
                                    setState(() {
                                      _model.isLiked = true;
                                    });
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
                          Builder(
                            builder: (context) {
                              if (FFAppState().repeatMode) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().repeatMode = false;
                                    await actions.setLoopMode(
                                      'p1',
                                    );
                                  },
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: const BoxDecoration(),
                                    child: Icon(
                                      FFIcons.knotHeart45,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                                    FFAppState().repeatMode = true;
                                    await actions.setLoopMode(
                                      'p1',
                                    );
                                  },
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: const BoxDecoration(),
                                    child: const Icon(
                                      FFIcons.krotationing,
                                      color: Color(0xFFD9D9D9),
                                      size: 32.0,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ].divide(const SizedBox(width: 48.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
