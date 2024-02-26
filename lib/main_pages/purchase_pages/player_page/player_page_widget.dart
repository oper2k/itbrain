import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/is_deleted_once/is_deleted_once_widget.dart';
import '/profile/is_downloaded_once/is_downloaded_once_widget.dart';
import '/profile/is_not_downloaded/is_not_downloaded_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'player_page_model.dart';
export 'player_page_model.dart';

class PlayerPageWidget extends StatefulWidget {
  const PlayerPageWidget({
    super.key,
    required this.audio,
    required this.index,
    required this.medCategory,
    this.meditation,
  });

  final List<MeditationsRecord>? audio;
  final int? index;
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
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x983A1537),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
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
                                    context.pushNamed(
                                      'meditationInfo',
                                      queryParameters: {
                                        'meditationCategory': serializeParam(
                                          widget.meditation,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'meditationCategory': widget.meditation,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Icon(
                                        FFIcons.kclose2,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
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
                                                title: valueOrDefault<String>(
                                                  widget.audio?[widget.index!]
                                                      ?.title,
                                                  'Медитация',
                                                ),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  widget.audio?[widget.index!]
                                                      ?.image,
                                                  'Медитация',
                                                ),
                                                description:
                                                    valueOrDefault<String>(
                                                  widget.audio?[widget.index!]
                                                      ?.description,
                                                  'Медитация',
                                                ),
                                              );

                                              await Share.share(
                                                _model.currentPageLink,
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            },
                                            child: Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(),
                                              child: Icon(
                                                FFIcons.kshare2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 32.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            if (functions.findTrackById(
                                                    widget.audio![widget.index!]
                                                        .reference.id,
                                                    FFAppState()
                                                        .downloadingTracks
                                                        .toList()) !=
                                                null)
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                child: custom_widgets
                                                    .CustomProgressBar(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  track:
                                                      functions.findTrackById(
                                                          widget
                                                              .audio![
                                                                  widget.index!]
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
                                                            .audio![
                                                                widget.index!]
                                                            .reference
                                                            .id,
                                                        FFAppState()
                                                            .downloadedTracks
                                                            .toList()) !=
                                                    null) {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.isDeleted =
                                                          await actions
                                                              .deleteFiles(
                                                        functions.findTrackById(
                                                            widget
                                                                .audio![widget
                                                                    .index!]
                                                                .reference
                                                                .id,
                                                            FFAppState()
                                                                .downloadedTracks
                                                                .toList()),
                                                      );
                                                      if (_model.isDeleted!) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      IsDeletedOnceWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .arrowCircleDown,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 30.0,
                                                    ),
                                                  );
                                                } else {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!(functions.findTrackById(
                                                              widget
                                                                  .audio![widget
                                                                      .index!]
                                                                  .reference
                                                                  .id,
                                                              FFAppState()
                                                                  .downloadingTracks
                                                                  .toList()) !=
                                                          null)) {
                                                        _model.isDownload =
                                                            await actions
                                                                .downloadUrl(
                                                          widget
                                                              .audio?[
                                                                  widget.index!]
                                                              ?.reference
                                                              .id,
                                                          widget
                                                              .audio?[
                                                                  widget.index!]
                                                              ?.audioPath,
                                                          widget
                                                              .audio?[
                                                                  widget.index!]
                                                              ?.image,
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
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.title
                                                              ..description = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.description
                                                              ..audioPath = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.audioPath
                                                              ..isPaid = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.isPaid
                                                              ..duration = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.duration
                                                              ..type = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.type
                                                              ..nameEng = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.titleEng
                                                              ..descriptionName = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.descriptionEng
                                                              ..durationEng = widget
                                                                  .audio?[widget
                                                                      .index!]
                                                                  ?.durationEng,
                                                          );
                                                        });
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      IsDownloadedOnceWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      IsNotDownloadedWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Icon(
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
                                            if ((currentUserDocument
                                                            ?.meditationsWishList
                                                            ?.toList() ??
                                                        [])
                                                    .contains(widget
                                                        .audio?[widget.index!]
                                                        ?.reference) ||
                                                _model.isAudioLiked) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'meditationsWishList':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget
                                                              .audio?[
                                                                  widget.index!]
                                                              ?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    _model.isAudioLiked = false;
                                                  });
                                                },
                                                child: Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons.favorite,
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'meditationsWishList':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget
                                                              .audio?[
                                                                  widget.index!]
                                                              ?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    _model.isAudioLiked = true;
                                                  });
                                                },
                                                child: Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    FFIcons.kheart,
                                                    color: Colors.white,
                                                    size: 32.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 32.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                ruText: widget.audio?[widget.index!]?.title,
                                enText: widget.audio?[widget.index!]?.titleEng,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                ruText:
                                    widget.audio?[widget.index!]?.description,
                                enText: widget
                                    .audio?[widget.index!]?.descriptionEng,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 15.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 48.0, 24.0, 0.0),
                            child: Container(
                              height: 55.0,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
                                      child: custom_widgets.CustomSlider(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        playId: 'p1',
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        inactiveColor:
                                            FlutterFlowTheme.of(context)
                                                .buttonColor2,
                                        id: widget.audio?[widget.index!]
                                            ?.reference.id,
                                        title:
                                            widget.audio?[widget.index!]?.title,
                                        duration: 20,
                                        image:
                                            widget.audio?[widget.index!]?.image,
                                        audioPath: widget
                                            .audio?[widget.index!]?.audioPath,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
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
                                            useGoogleFonts: false,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 38.0, 0.0, 92.0),
                            child: Container(
                              decoration: BoxDecoration(),
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
                                      await actions.createDataType(
                                        widget.audio?[valueOrDefault<int>(
                                          (widget.index!) - 1,
                                          1,
                                        )],
                                      );

                                      context.goNamed(
                                        'playerPage',
                                        queryParameters: {
                                          'audio': serializeParam(
                                            widget.audio,
                                            ParamType.Document,
                                            true,
                                          ),
                                          'index': serializeParam(
                                            valueOrDefault<int>(
                                              (widget.index!) - 1,
                                              1,
                                            ),
                                            ParamType.int,
                                          ),
                                          'medCategory': serializeParam(
                                            widget.medCategory,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'audio': widget.audio,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  Container(
                                    width: 56.0,
                                    height: 56.0,
                                    child: Stack(
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (FFAppState().isAudioPlaying) {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 48.0,
                                                  buttonSize: 64.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    FFIcons.k4,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await actions.playOrPause(
                                                      'p1',
                                                    );
                                                    setState(() {
                                                      FFAppState()
                                                              .isAudioPlaying =
                                                          false;
                                                    });
                                                  },
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await actions.playOrPause(
                                                    'p1',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                        .isAudioPlaying = true;
                                                  });
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
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
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
                                  Builder(
                                    builder: (context) {
                                      if ((currentUserDocument
                                                  ?.purchasedMeditationsPacks
                                                  ?.toList() ??
                                              [])
                                          .contains(
                                              widget.meditation?.reference)) {
                                        return FlutterFlowIconButton(
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
                                            await actions.createDataType(
                                              widget
                                                  .audio?[(widget.index!) + 1],
                                            );

                                            context.goNamed(
                                              'playerPage',
                                              queryParameters: {
                                                'audio': serializeParam(
                                                  widget.audio,
                                                  ParamType.Document,
                                                  true,
                                                ),
                                                'index': serializeParam(
                                                  valueOrDefault<int>(
                                                    (widget.index!) + 1,
                                                    1,
                                                  ),
                                                  ParamType.int,
                                                ),
                                                'medCategory': serializeParam(
                                                  widget.medCategory,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'audio': widget.audio,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await actions.seekAudio(
                                        'p1',
                                        FFAppState().positionMS + 30000,
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(width: 24.0)),
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
