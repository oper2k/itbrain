import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'study_comp_model.dart';
export 'study_comp_model.dart';

class StudyCompWidget extends StatefulWidget {
  const StudyCompWidget({
    super.key,
    required this.course,
  });

  final StudyCategoriesRecord? course;

  @override
  State<StudyCompWidget> createState() => _StudyCompWidgetState();
}

class _StudyCompWidgetState extends State<StudyCompWidget> {
  late StudyCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.course?.soon ?? false) {
          return Container(
            width: double.infinity,
            height: 190.0,
            decoration: BoxDecoration(
              color: const Color(0x15FFFFFF),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getVariableText(
                              ruText: widget.course?.title,
                              enText: widget.course?.titleEng,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                ruText: widget.course?.description,
                                enText: widget.course?.descrEng,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                    lineHeight: 1.23,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'STUDY_COMP_COMP_Stack_d5lck5o3_ON_TAP');
                        logFirebaseEvent('Stack_navigate_to');

                        context.pushNamed(
                          'studyInfoPage',
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
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'z9pynuek' /* Узнать подробнее */,
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
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 6.0, 0.0),
                              child: Transform.rotate(
                                angle: 4.0 * (math.pi / 180),
                                child: Container(
                                  width: 62.0,
                                  height: 24.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'fgdbuy0p' /* СКОРО */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              fontSize: 13.0,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if ((currentUserDocument?.purchasedStudyPacks.toList() ?? [])
            .contains(widget.course?.reference)) {
          return StreamBuilder<List<LessonsRecord>>(
            stream: queryLessonsRecord(
              queryBuilder: (lessonsRecord) => lessonsRecord
                  .where(
                    'course',
                    isEqualTo: widget.course?.reference,
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
                height: MediaQuery.sizeOf(context).width - 48,
                decoration: BoxDecoration(
                  color: const Color(0x15FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      widget.course!.cover,
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: widget.course?.title,
                                    enText: widget.course?.titleEng,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.14,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    FFLocalizations.of(context).getVariableText(
                                      ruText: valueOrDefault<String>(
                                        widget.course?.description,
                                        '0',
                                      ),
                                      enText: widget.course?.descrEng,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                        lineHeight: 1.23,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2hzh15uf' /* Просмотрено */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.23,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${valueOrDefault<String>(
                                          formatNumber(
                                            functions.progress(
                                                functions
                                                    .viewedAndAllLessons(
                                                        (currentUserDocument
                                                                    ?.completeLessons
                                                                    .toList() ??
                                                                [])
                                                            .map((e) => e.id)
                                                            .toList(),
                                                        containerLessonsRecordList
                                                            .map((e) =>
                                                                e.reference.id)
                                                            .toList())
                                                    .toDouble(),
                                                valueOrDefault<double>(
                                                  containerLessonsRecordList
                                                      .where((e) =>
                                                          e.course ==
                                                          widget.course
                                                              ?.reference)
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
                                        )} %',
                                        '0 %',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.23,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        functions.progressFull(
                                            functions
                                                .viewedAndAllLessons(
                                                    (currentUserDocument
                                                                ?.completeLessons
                                                                .toList() ??
                                                            [])
                                                        .map((e) => e.id)
                                                        .toList(),
                                                    containerLessonsRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList())
                                                .toDouble(),
                                            valueOrDefault<double>(
                                              containerLessonsRecordList
                                                  .where((e) =>
                                                      e.course ==
                                                      widget.course?.reference)
                                                  .toList()
                                                  .length
                                                  .toDouble(),
                                              0.0,
                                            )),
                                        0.0,
                                      ),
                                      lineHeight: 6.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      backgroundColor: const Color(0x67FFFFFF),
                                      barRadius: const Radius.circular(10.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'STUDY_Container_mk19knhn_ON_TAP');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    'studyLevels',
                                    queryParameters: {
                                      'course': serializeParam(
                                        widget.course,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'course': widget.course,
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 42.0,
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
                                        'fs07da0s' /* Перейти в курс */,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).width - 48,
            decoration: BoxDecoration(
              color: const Color(0x15FFFFFF),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  widget.course!.cover,
                ).image,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getVariableText(
                              ruText: widget.course?.title,
                              enText: widget.course?.titleEng,
                            ),
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                ruText: widget.course?.description,
                                enText: widget.course?.descrEng,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'STUDY_Container_wk6botf6_ON_TAP');
                                logFirebaseEvent('Container_launch_u_r_l');
                                await launchURL(
                                    FFLocalizations.of(context).getVariableText(
                                  ruText: widget.course?.courseUrl,
                                  enText: widget.course?.courseEngUrl,
                                ));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 42.0,
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
                                      'tnq0fkkt' /* Узнать подробнее */,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
