import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'study_level_info_model.dart';
export 'study_level_info_model.dart';

class StudyLevelInfoWidget extends StatefulWidget {
  const StudyLevelInfoWidget({
    super.key,
    required this.study,
    required this.levels,
    required this.currentLevelndex,
  });

  final StudyCategoriesRecord? study;
  final LevelsRecord? levels;
  final int? currentLevelndex;

  @override
  State<StudyLevelInfoWidget> createState() => _StudyLevelInfoWidgetState();
}

class _StudyLevelInfoWidgetState extends State<StudyLevelInfoWidget> {
  late StudyLevelInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyLevelInfoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      await actions.notCreateScreenshots();
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
        body: StreamBuilder<List<LessonsRecord>>(
          stream: queryLessonsRecord(
            queryBuilder: (lessonsRecord) => lessonsRecord
                .where(
                  'level',
                  isEqualTo: widget.levels?.reference,
                )
                .where(
                  'lang',
                  isEqualTo: FFLocalizations.of(context).languageCode,
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
            List<LessonsRecord> containerLessonsRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF370C59),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -0.92),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 0.0),
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
                              context.safePop();
                            },
                            child: Container(
                              width: 40.0,
                              height: 44.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Icon(
                                  FFIcons.kleft2,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/telegram-cloud-document-4-5791884542503557386_1.webp',
                                  width: 134.0,
                                  fit: BoxFit.contain,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              '${FFLocalizations.of(context).getVariableText(
                                                ruText: 'Пройдено',
                                                enText: 'Finished',
                                              )} ${valueOrDefault<String>(
                                                formatNumber(
                                                  functions.progress(
                                                      (currentUserDocument
                                                                  ?.completeLessons
                                                                  .toList() ??
                                                              [])
                                                          .length
                                                          .toDouble(),
                                                      valueOrDefault<double>(
                                                        containerLessonsRecordList
                                                            .where((e) =>
                                                                (e.level ==
                                                                    widget
                                                                        .levels
                                                                        ?.reference) &&
                                                                (e.course ==
                                                                    widget.study
                                                                        ?.reference))
                                                            .toList()
                                                            .length
                                                            .toDouble(),
                                                        0.0,
                                                      )),
                                                  formatType: FormatType.custom,
                                                  format: '',
                                                  locale: '',
                                                ),
                                                '0',
                                              )}%',
                                              '0%',
                                            ),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              ruText: widget.levels?.title,
                                              enText: widget.levels?.titleEng,
                                            ),
                                            textAlign: TextAlign.end,
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final lessons = containerLessonsRecordList
                                      .sortedList((e) => e.order)
                                      .toList();
                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      32.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: lessons.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 12.0),
                                    itemBuilder: (context, lessonsIndex) {
                                      final lessonsItem = lessons[lessonsIndex];
                                      return Visibility(
                                        visible: functions.isLessonAvailable(
                                            getCurrentTimestamp,
                                            (currentUserDocument
                                                        ?.purchasedCoursesDates
                                                        .toList() ??
                                                    [])
                                                .where((e) =>
                                                    e.courseRef ==
                                                    widget.study?.reference)
                                                .toList()
                                                .first
                                                .purchasedDate!,
                                            lessonsItem.order),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'contentPage',
                                                queryParameters: {
                                                  'lesson': serializeParam(
                                                    lessonsItem,
                                                    ParamType.Document,
                                                  ),
                                                  'isLastLesson':
                                                      serializeParam(
                                                    lessonsIndex ==
                                                            valueOrDefault<int>(
                                                              containerLessonsRecordList
                                                                      .length -
                                                                  1,
                                                              0,
                                                            )
                                                        ? true
                                                        : false,
                                                    ParamType.bool,
                                                  ),
                                                  'level': serializeParam(
                                                    widget.levels,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'lesson': lessonsItem,
                                                  'level': widget.levels,
                                                },
                                              );
                                            },
                                            child: Builder(
                                              builder: (context) {
                                                if ((currentUserDocument
                                                            ?.completeLessons
                                                            .toList() ??
                                                        [])
                                                    .contains(lessonsItem
                                                        .reference)) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 65.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x10FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              lessonsItem.title,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Evolventa',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            FFIcons.kitsok,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 65.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x1EFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              lessonsItem.title
                                                                  .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Evolventa',
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            FFIcons
                                                                .krightDMTnew,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]
                              .addToStart(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 46.0)),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<List<LevelsRecord>>(
                    future: queryLevelsRecordOnce(
                      queryBuilder: (levelsRecord) => levelsRecord
                          .where(
                            'course_ref',
                            isEqualTo: widget.study?.reference,
                          )
                          .where(
                            'count',
                            isGreaterThan: valueOrDefault<String>(
                              ((widget.currentLevelndex!) + 1).toString(),
                              '0',
                            ),
                          ),
                      singleRecord: true,
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
                      List<LevelsRecord> containerLevelsRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerLevelsRecord =
                          containerLevelsRecordList.isNotEmpty
                              ? containerLevelsRecordList.first
                              : null;
                      return Container(
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible:
                              (currentUserDocument?.completedLevels.toList() ??
                                      [])
                                  .contains(widget.levels?.reference),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 46.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if ((currentUserDocument?.purchasedLevels
                                              .toList() ??
                                          [])
                                      .contains(
                                          containerLevelsRecord?.reference)) {
                                    context.pushNamed(
                                      'studyLevelInfo',
                                      queryParameters: {
                                        'study': serializeParam(
                                          widget.study,
                                          ParamType.Document,
                                        ),
                                        'levels': serializeParam(
                                          containerLevelsRecord,
                                          ParamType.Document,
                                        ),
                                        'currentLevelndex': serializeParam(
                                          valueOrDefault<int>(
                                            (widget.currentLevelndex!) + 1,
                                            0,
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'study': widget.study,
                                        'levels': containerLevelsRecord,
                                      },
                                    );
                                  } else {
                                    await launchURL(FFLocalizations.of(context)
                                        .getVariableText(
                                      ruText:
                                          containerLevelsRecord?.getCourseUrl,
                                      enText: containerLevelsRecord
                                          ?.getCourseUrlEng,
                                    ));
                                  }
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
                                        'tysk2a96' /* Перейти на следующий уровень */,
                                      ),
                                      textAlign: TextAlign.center,
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
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
