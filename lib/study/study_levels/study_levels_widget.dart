import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/level_not_avaliable/level_not_avaliable_widget.dart';
import '/study/progress_bar/progress_bar_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'study_levels_model.dart';
export 'study_levels_model.dart';

class StudyLevelsWidget extends StatefulWidget {
  const StudyLevelsWidget({
    super.key,
    required this.course,
  });

  final StudyCategoriesRecord? course;

  @override
  State<StudyLevelsWidget> createState() => _StudyLevelsWidgetState();
}

class _StudyLevelsWidgetState extends State<StudyLevelsWidget> {
  late StudyLevelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyLevelsModel());

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<LevelsRecord>>(
          stream: queryLevelsRecord(
            queryBuilder: (levelsRecord) => levelsRecord
                .where(
                  'course_ref',
                  isEqualTo: widget.course?.reference,
                )
                .orderBy('count'),
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
            List<LevelsRecord> containerLevelsRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF370C59),
              ),
              child: StreamBuilder<List<LessonsRecord>>(
                stream: queryLessonsRecord(
                  queryBuilder: (lessonsRecord) => lessonsRecord.where(
                    'course',
                    isEqualTo: widget.course?.reference,
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
                  List<LessonsRecord> containerLessonsRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 44.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -0.92),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
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
                                                          context.safePop();
                                                        },
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 44.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Icon(
                                                              FFIcons.kleft2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    '${FFLocalizations.of(context).getVariableText(
                                                      ruText: 'Пройдено',
                                                      enText: 'Finished',
                                                    )} ${valueOrDefault<String>(
                                                      formatNumber(
                                                        (valueOrDefault<int>(
                                                                  (currentUserDocument
                                                                              ?.completeLessons
                                                                              .toList() ??
                                                                          [])
                                                                      .length,
                                                                  0,
                                                                ) /
                                                                valueOrDefault<
                                                                    int>(
                                                                  containerLessonsRecordList
                                                                      .where((e) =>
                                                                          e.course ==
                                                                          widget
                                                                              .course
                                                                              ?.reference)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                )) *
                                                            100,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '',
                                                        locale: '',
                                                      ),
                                                      '0',
                                                    )}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 130.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        30.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                ruText: widget
                                                                    .course
                                                                    ?.title,
                                                                enText: widget
                                                                    .course
                                                                    ?.titleEng,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Evolventa',
                                                                    fontSize:
                                                                        28.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Image.asset(
                                              'assets/images/telegram-cloud-document-4-5791884542503557378_1.webp',
                                              width: 125.0,
                                              height: 164.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'm5f4vain' /* Уровни */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: const Color(0xB3FFFFFF),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 20.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final levels =
                                                containerLevelsRecordList
                                                    .toList();
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:
                                                    List.generate(levels.length,
                                                        (levelsIndex) {
                                                  final levelsItem =
                                                      levels[levelsIndex];
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
                                                      if ((currentUserDocument
                                                                  ?.purchasedLevels
                                                                  .toList() ??
                                                              [])
                                                          .contains(levelsItem
                                                              .reference)) {
                                                        context.pushNamed(
                                                          'studyLevelInfo',
                                                          queryParameters: {
                                                            'study':
                                                                serializeParam(
                                                              widget.course,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'levels':
                                                                serializeParam(
                                                              levelsItem,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'currentLevelndex':
                                                                serializeParam(
                                                              levelsIndex,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'study':
                                                                widget.course,
                                                            'levels':
                                                                levelsItem,
                                                          },
                                                        );
                                                      } else {
                                                        _model.isPreviusPurchased =
                                                            (currentUserDocument
                                                                        ?.purchasedLevels
                                                                        .toList() ??
                                                                    [])
                                                                .contains(containerLevelsRecordList[
                                                                        valueOrDefault<
                                                                            int>(
                                                          (int index) {
                                                            return index == 0
                                                                ? 0
                                                                : index - 1;
                                                          }(levelsIndex),
                                                          0,
                                                        )]
                                                                    .reference);
                                                        _model.isPreviusCompleted =
                                                            (currentUserDocument
                                                                        ?.completedLevels
                                                                        .toList() ??
                                                                    [])
                                                                .contains(containerLevelsRecordList[
                                                                        valueOrDefault<
                                                                            int>(
                                                          (int index) {
                                                            return index == 0
                                                                ? 0
                                                                : index - 1;
                                                          }(levelsIndex),
                                                          0,
                                                        )]
                                                                    .reference);
                                                        _model.previusLevelTitle =
                                                            containerLevelsRecordList[
                                                                    valueOrDefault<
                                                                        int>(
                                                          (int index) {
                                                            return index == 0
                                                                ? 0
                                                                : index - 1;
                                                          }(levelsIndex),
                                                          0,
                                                        )]
                                                                .title;
                                                        setState(() {});
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                                    LevelNotAvaliableWidget(
                                                                  levelInfo:
                                                                      levelsItem,
                                                                  showButton:
                                                                      () {
                                                                    if (_model.isPreviusPurchased &&
                                                                        !_model
                                                                            .isPreviusCompleted) {
                                                                      return false;
                                                                    } else if (_model
                                                                            .isPreviusPurchased &&
                                                                        _model
                                                                            .isPreviusCompleted &&
                                                                        !(currentUserDocument?.purchasedLevels.toList() ??
                                                                                [])
                                                                            .contains(levelsItem.reference)) {
                                                                      return true;
                                                                    } else {
                                                                      return false;
                                                                    }
                                                                  }(),
                                                                  url: !(currentUserDocument?.purchasedLevels.toList() ??
                                                                              [])
                                                                          .contains(containerLevelsRecordList[valueOrDefault<
                                                                                  int>(
                                                                    (int
                                                                        index) {
                                                                      return (index - 1) ==
                                                                              -1
                                                                          ? 0
                                                                          : index -
                                                                              1;
                                                                    }(levelsIndex),
                                                                    0,
                                                                  )]
                                                                              .reference)
                                                                      ? FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                          ruText: containerLevelsRecordList[valueOrDefault<int>(
                                                                            (int
                                                                                index) {
                                                                              return index == 0 ? 0 : index - 1;
                                                                            }(levelsIndex),
                                                                            0,
                                                                          )]
                                                                              .getCourseUrl,
                                                                          enText: containerLevelsRecordList[valueOrDefault<int>(
                                                                            (int
                                                                                index) {
                                                                              return index == 0 ? 0 : index - 1;
                                                                            }(levelsIndex),
                                                                            0,
                                                                          )]
                                                                              .getCourseUrlEng,
                                                                        )
                                                                      : FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                          ruText:
                                                                              levelsItem.getCourseUrl,
                                                                          enText:
                                                                              levelsItem.getCourseUrlEng,
                                                                        ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if ((currentUserDocument
                                                                          ?.purchasedLevels
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      levelsItem
                                                                          .reference))
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          ProgressBarWidget(
                                                                    key: Key(
                                                                        'Key6bb_${levelsIndex}_of_${levels.length}'),
                                                                  ),
                                                                ),
                                                              if (!(currentUserDocument
                                                                          ?.purchasedLevels
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      levelsItem
                                                                          .reference))
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Icon(
                                                                    FFIcons
                                                                        .klockLevels,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              if (levelsIndex !=
                                                                  valueOrDefault<
                                                                      int>(
                                                                    containerLevelsRecordList
                                                                            .length -
                                                                        1,
                                                                    0,
                                                                  ))
                                                                Container(
                                                                  width: 2.0,
                                                                  height: 54.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${FFLocalizations.of(context).getVariableText(
                                                                    ruText:
                                                                        'Уровень',
                                                                    enText:
                                                                        'Level',
                                                                  )} ${valueOrDefault<String>(
                                                                    levelsItem
                                                                        .count,
                                                                    '0',
                                                                  )}',
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Evolventa',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  ruText:
                                                                      levelsItem
                                                                          .title,
                                                                  enText: levelsItem
                                                                      .titleEng,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Evolventa',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'lessonsAllCodes',
                                queryParameters: {
                                  'courseInfo': serializeParam(
                                    widget.course,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'courseInfo': widget.course,
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: const Color(0x1EFFFFFF),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ptvcl6lu' /* Слушать все коды */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].addToEnd(const SizedBox(height: 46.0)),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
