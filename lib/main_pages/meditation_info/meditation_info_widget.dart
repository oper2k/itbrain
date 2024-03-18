import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/main_pages/meditations_offline/meditations_offline_widget.dart';
import '/profile/is_deleted/is_deleted_widget.dart';
import '/profile/is_downloaded_all/is_downloaded_all_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'meditation_info_model.dart';
export 'meditation_info_model.dart';

class MeditationInfoWidget extends StatefulWidget {
  const MeditationInfoWidget({
    super.key,
    required this.meditationCategory,
  });

  final MeditationCategoriesRecord? meditationCategory;

  @override
  State<MeditationInfoWidget> createState() => _MeditationInfoWidgetState();
}

class _MeditationInfoWidgetState extends State<MeditationInfoWidget>
    with TickerProviderStateMixin {
  late MeditationInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          color: Colors.white,
          angle: 0.524,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationInfoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
      unawaited(
        () async {
          await actions.stopMusic(
            'p1',
          );
        }(),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<MeditationsRecord>>(
          stream: FFAppState().meditationCategoryPage(
            uniqueQueryKey: widget.meditationCategory?.reference.id,
            requestFn: () => queryMeditationsRecord(
              queryBuilder: (meditationsRecord) => meditationsRecord.where(
                'meditationCategory',
                isEqualTo: widget.meditationCategory?.reference,
              ),
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                ),
              );
            }
            List<MeditationsRecord> containerMeditationsRecordList =
                snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Frame_11818.png',
                  ).image,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/2vqf7_',
                              ).image,
                            ),
                          ),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            children: [
                              Image.asset(
                                'assets/images/Frame_12202.webp',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -0.92),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 44.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 44.0,
                                          decoration: const BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Icon(
                                              FFIcons.kleft2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if ((_model.downloadProgress! > 0) &&
                                          (_model.downloadProgress != 100))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              '${_model.downloadProgress?.toString()}% из 100%',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      if ((currentUserDocument
                                                  ?.purchasedMeditationsPacks
                                                  .toList() ??
                                              [])
                                          .contains(widget
                                              .meditationCategory?.reference))
                                        AuthUserStreamWidget(
                                          builder: (context) => SizedBox(
                                            width: 44.0,
                                            height: 44.0,
                                            child: Stack(
                                              children: [
                                                if ((FFAppState()
                                                            .downloadedTracks
                                                            .where((e) =>
                                                                e.category ==
                                                                widget
                                                                    .meditationCategory
                                                                    ?.reference
                                                                    .id)
                                                            .toList()
                                                            .length >=
                                                        containerMeditationsRecordList
                                                            .length) &&
                                                    ((_model.downloadProgress
                                                                .toString() ==
                                                            '0') ||
                                                        (_model.downloadProgress ==
                                                            100)))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      while (_model
                                                              .iterationIndex <
                                                          containerMeditationsRecordList
                                                              .length) {
                                                        _model.isDeleted =
                                                            await actions
                                                                .deleteFiles(
                                                          functions.findTrackById(
                                                              containerMeditationsRecordList[
                                                                      _model
                                                                          .iterationIndex]
                                                                  .reference
                                                                  .id,
                                                              FFAppState()
                                                                  .downloadedTracks
                                                                  .toList()),
                                                        );
                                                        setState(() {
                                                          _model.iterationIndex =
                                                              _model.iterationIndex +
                                                                  1;
                                                        });
                                                      }
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  const IsDeletedWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      setState(() {
                                                        _model.iterationIndex =
                                                            0;
                                                      });

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 44.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .arrowCircleDown,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .downloadedTracks
                                                            .where((e) =>
                                                                e.category ==
                                                                widget
                                                                    .meditationCategory
                                                                    ?.reference
                                                                    .id)
                                                            .toList()
                                                            .length <
                                                        containerMeditationsRecordList
                                                            .length) &&
                                                    ((_model.downloadProgress ==
                                                            0) ||
                                                        (_model.downloadProgress ==
                                                            100)))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.downloadProgress =
                                                            5;
                                                      });
                                                      while (_model
                                                              .iterationIndex <
                                                          containerMeditationsRecordList
                                                              .length) {
                                                        _model.isDownload =
                                                            await actions
                                                                .downloadUrl(
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .reference
                                                              .id,
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .audioPath,
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .image,
                                                        );
                                                        if (_model
                                                            .isDownload!) {
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
                                                              ..name =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .title
                                                              ..description =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .description
                                                              ..audioPath =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .audioPath
                                                              ..isPaid =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .isPaid
                                                              ..duration =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .duration
                                                              ..type =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .type
                                                              ..category =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .meditationCategory
                                                                      ?.id
                                                              ..meditationCategorg =
                                                                  widget
                                                                      .meditationCategory
                                                                      ?.reference
                                                              ..nameEng =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .titleEng
                                                              ..descriptionName =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .descriptionEng
                                                              ..durationEng =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .durationEng,
                                                          );
                                                        }
                                                        setState(() {
                                                          _model.iterationIndex =
                                                              _model.iterationIndex +
                                                                  1;
                                                          _model
                                                              .downloadProgress = (100 /
                                                                  containerMeditationsRecordList
                                                                      .length)
                                                              .round();
                                                        });
                                                      }
                                                      setState(() {
                                                        _model.iterationIndex =
                                                            0;
                                                        _model.downloadProgress =
                                                            100;
                                                      });
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  const IsDownloadedAllWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 44.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          FFIcons.kshare3,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 32.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((_model.downloadProgress! >
                                                        0) &&
                                                    (_model.downloadProgress !=
                                                        100))
                                                  Container(
                                                    width: 40.0,
                                                    height: 44.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .downloading_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 26.0,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation']!),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 24.0, 4.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getVariableText(
                                  ruText:
                                      widget.meditationCategory?.nameCategory,
                                  enText: widget
                                      .meditationCategory?.nameCategoryEng,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 8.0, 4.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (!_model.more) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.more = true;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                    ruText: widget
                                                        .meditationCategory
                                                        ?.descriptionCategory,
                                                    enText: widget
                                                        .meditationCategory
                                                        ?.descriptionCategoryEng,
                                                  )
                                                  .maybeHandleOverflow(
                                                      maxChars: 105),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 17.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.41,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'aux1f2j3' /* eщё */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.41,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.more = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  ruText: widget
                                                      .meditationCategory
                                                      ?.descriptionCategory,
                                                  enText: widget
                                                      .meditationCategory
                                                      ?.descriptionCategoryEng,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 17.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.41,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5r55xoqj' /* свернуть */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.41,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          if (!(currentUserDocument?.purchasedMeditationsPacks
                                          .toList() ??
                                      [])
                                  .contains(
                                      widget.meditationCategory?.reference) &&
                              !FFAppState().isOffline)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    unawaited(
                                      () async {
                                        await launchURL(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          ruText: widget
                                              .meditationCategory?.getCourseUrl,
                                          enText: widget.meditationCategory
                                              ?.getCourseUrlEng,
                                        ));
                                      }(),
                                    );

                                    context.goNamed(
                                      'paymentPage',
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
                                  child: Container(
                                    width: double.infinity,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF9747FF),
                                          Color(0xFFF1618E),
                                          Color(0xFFFE710B)
                                        ],
                                        stops: [0.0, 0.4, 1.0],
                                        begin: AlignmentDirectional(1.0, 0.34),
                                        end: AlignmentDirectional(-1.0, -0.34),
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'vnfzb2oi' /* Узнать больше и купить */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 0.0),
                              child: Text(
                                '${valueOrDefault<String>(
                                  containerMeditationsRecordList.length
                                      .toString(),
                                  '0',
                                )}${FFLocalizations.of(context).getVariableText(
                                  ruText: ' аудиозаписей внутри',
                                  enText: ' audios  inside',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (!FFAppState().isOffline) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 32.0),
                                  child: Builder(
                                    builder: (context) {
                                      final meditations =
                                          containerMeditationsRecordList
                                              .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: meditations.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 36.0),
                                        itemBuilder:
                                            (context, meditationsIndex) {
                                          final meditationsItem =
                                              meditations[meditationsIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (meditationsItem.isPaid) {
                                                    if ((currentUserDocument
                                                                ?.purchasedMeditationsPacks
                                                                .toList() ??
                                                            [])
                                                        .contains(meditationsItem
                                                            .meditationCategory)) {
                                                      setState(() {
                                                        FFAppState()
                                                            .positionMS = 0;
                                                        FFAppState()
                                                                .playerIndex =
                                                            valueOrDefault<int>(
                                                          meditationsIndex,
                                                          0,
                                                        );
                                                      });
                                                      await actions.stopMusic(
                                                        'p1',
                                                      );

                                                      context.pushNamed(
                                                        'playerPage',
                                                        queryParameters: {
                                                          'audio':
                                                              serializeParam(
                                                            containerMeditationsRecordList,
                                                            ParamType.Document,
                                                            true,
                                                          ),
                                                          'medCategory':
                                                              serializeParam(
                                                            meditationsItem
                                                                .meditationCategory,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'meditation':
                                                              serializeParam(
                                                            widget
                                                                .meditationCategory,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'audio':
                                                              containerMeditationsRecordList,
                                                          'meditation': widget
                                                              .meditationCategory,
                                                        },
                                                      );

                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  } else {
                                                    setState(() {
                                                      FFAppState().positionMS =
                                                          0;
                                                      FFAppState().playerIndex =
                                                          meditationsIndex;
                                                    });
                                                    await actions.stopMusic(
                                                      'p1',
                                                    );

                                                    context.pushNamed(
                                                      'playerPage',
                                                      queryParameters: {
                                                        'audio': serializeParam(
                                                          containerMeditationsRecordList,
                                                          ParamType.Document,
                                                          true,
                                                        ),
                                                        'medCategory':
                                                            serializeParam(
                                                          meditationsItem
                                                              .meditationCategory,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'meditation':
                                                            serializeParam(
                                                          widget
                                                              .meditationCategory,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'audio':
                                                            containerMeditationsRecordList,
                                                        'meditation': widget
                                                            .meditationCategory,
                                                      },
                                                    );

                                                    return;
                                                  }
                                                },
                                                child: MeditationsWidget(
                                                  key: Key(
                                                      'Keybv2_${meditationsIndex}_of_${meditations.length}'),
                                                  meditation: meditationsItem,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final offline = FFAppState()
                                          .downloadedTracks
                                          .where((e) =>
                                              e.meditationCategorg ==
                                              widget.meditationCategory
                                                  ?.reference)
                                          .toList();
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          36.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: offline.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 36.0),
                                        itemBuilder: (context, offlineIndex) {
                                          final offlineItem =
                                              offline[offlineIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'offlinePlayerPage',
                                                  queryParameters: {
                                                    'currentAudioIndex':
                                                        serializeParam(
                                                      offlineIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: MeditationsOfflineWidget(
                                                key: Key(
                                                    'Keyjq7_${offlineIndex}_of_${offline.length}'),
                                                indexInList: offlineIndex,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
