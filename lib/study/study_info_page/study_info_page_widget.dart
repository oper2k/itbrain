import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'study_info_page_model.dart';
export 'study_info_page_model.dart';

class StudyInfoPageWidget extends StatefulWidget {
  const StudyInfoPageWidget({
    super.key,
    required this.courseInfo,
  });

  final StudyCategoriesRecord? courseInfo;

  @override
  State<StudyInfoPageWidget> createState() => _StudyInfoPageWidgetState();
}

class _StudyInfoPageWidgetState extends State<StudyInfoPageWidget> {
  late StudyInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyInfoPageModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF370C59),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: ClipRRect(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        children: [
                          CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget.courseInfo!.courseInfoImage,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.92),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Icon(
                                          FFIcons.kleft2,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
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
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: widget.courseInfo?.duration,
                                    enText: widget.courseInfo?.durationEng,
                                  ),
                                  '0',
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
                          if (widget.courseInfo?.soon ?? true)
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Transform.rotate(
                                  angle: 4.0 * (math.pi / 180),
                                  child: Container(
                                    width: 62.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
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
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0hwzv6dz' /* Скоро */,
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
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
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
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: widget.courseInfo?.courseText,
                                    enText: widget.courseInfo?.courseTextEng,
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
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      if (widget.courseInfo?.soon ?? true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (!_model.isPushOn) {
                                return Visibility(
                                  visible: widget
                                          .courseInfo?.showNotificationButton ??
                                      true,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await FfCustomPushNotificationsRecord
                                          .collection
                                          .doc()
                                          .set(
                                              createFfCustomPushNotificationsRecordData(
                                            tag: '',
                                            isRepeat: false,
                                            repeatInterval: '',
                                            status: 'started',
                                            targetAudience: 'All',
                                            userRefs: currentUserReference?.id,
                                            variable: '',
                                            parameterData: '',
                                            notificationTitle:
                                                '${FFLocalizations.of(context).getVariableText(
                                              ruText: 'Курс',
                                              enText: 'Course',
                                            )}\"${FFLocalizations.of(context).getVariableText(
                                              ruText: widget.courseInfo?.title,
                                              enText:
                                                  widget.courseInfo?.titleEng,
                                            )}\"${FFLocalizations.of(context).getVariableText(
                                              ruText: ' теперь доступен!',
                                              enText: 'is avaliable now!',
                                            )}',
                                            notificationText:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              ruText: 'Зайди, чтобы проверить!',
                                              enText: 'Click to check!',
                                            ),
                                            condition: '',
                                            conditionValue: '',
                                            initialPageName: 'studyPage',
                                            timestamp: getCurrentTimestamp,
                                            scheduledTime:
                                                widget.courseInfo?.startDate,
                                            notificationImageUrl: '',
                                          ));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9747FF),
                                            Color(0xFFF1618E),
                                            Color(0xFFFE710B)
                                          ],
                                          stops: [0.0, 0.4, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, 0.34),
                                          end:
                                              AlignmentDirectional(-1.0, -0.34),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '6fzep0g2' /* Напомнить об открытии продаж */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wwbhgqk2' /* Вы подписались на уведомления */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            color: Color(0x67FFFFFF),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
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
