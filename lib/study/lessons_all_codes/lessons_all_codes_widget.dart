import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/lesson_audio/lesson_audio_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'lessons_all_codes_model.dart';
export 'lessons_all_codes_model.dart';

class LessonsAllCodesWidget extends StatefulWidget {
  const LessonsAllCodesWidget({
    super.key,
    required this.courseInfo,
  });

  final StudyCategoriesRecord? courseInfo;

  @override
  State<LessonsAllCodesWidget> createState() => _LessonsAllCodesWidgetState();
}

class _LessonsAllCodesWidgetState extends State<LessonsAllCodesWidget> {
  late LessonsAllCodesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsAllCodesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
      await actions.lockOrientation();
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
                  'course',
                  isEqualTo: widget.courseInfo?.reference,
                )
                .where(
                  'lang',
                  isEqualTo: FFLocalizations.of(context).languageCode,
                )
                .orderBy('order'),
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
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            children: [
                              CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: widget.courseInfo!.courseInfoImage,
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
                          const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getVariableText(
                                  ruText: widget.courseInfo?.title,
                                  enText: widget.courseInfo?.titleEng,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'uucso3rn' /* Для вашего удобства, мы собрал... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.29,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 0.0),
                              child: Text(
                                '${containerLessonsRecordList.length.toString()}${FFLocalizations.of(context).getVariableText(
                                  ruText: ' аудио',
                                  enText: ' audios ',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 32.0),
                            child: Builder(
                              builder: (context) {
                                final lessons =
                                    containerLessonsRecordList.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: lessons.length,
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
                                                      widget.courseInfo
                                                          ?.reference)
                                                  .toList()
                                                  .first
                                                  .purchasedDate!,
                                              lessonsItem.order) &&
                                          (lessonsItem.mainAudio != ''),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 34.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            decoration: const BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.meditations = await actions
                                                    .convertLessonsListToMeditationsList(
                                                  containerLessonsRecordList
                                                      .toList(),
                                                );
                                                FFAppState().playerIndex =
                                                    lessonsIndex;
                                                setState(() {});

                                                context.pushNamed(
                                                  'playerPage',
                                                  queryParameters: {
                                                    'audio': serializeParam(
                                                      _model.meditations,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'audio': _model.meditations,
                                                  },
                                                );

                                                setState(() {});
                                              },
                                              child: LessonAudioWidget(
                                                key: Key(
                                                    'Keyks7_${lessonsIndex}_of_${lessons.length}'),
                                                lessons: lessonsItem,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
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
