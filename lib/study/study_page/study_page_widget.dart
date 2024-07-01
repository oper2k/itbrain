import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbar/navbar_study/navbar_study_widget.dart';
import '/study/study_comp/study_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'study_page_model.dart';
export 'study_page_model.dart';

class StudyPageWidget extends StatefulWidget {
  const StudyPageWidget({super.key});

  @override
  State<StudyPageWidget> createState() => _StudyPageWidgetState();
}

class _StudyPageWidgetState extends State<StudyPageWidget>
    with TickerProviderStateMixin {
  late StudyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'studyPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STUDY_PAGE_PAGE_studyPage_ON_INIT_STATE');
      logFirebaseEvent('studyPage_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('studyPage_custom_action');
      await actions.yesCreateScreenshots();
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 820.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        body: Stack(
          children: [
            StreamBuilder<List<StudyCategoriesRecord>>(
              stream: queryStudyCategoriesRecord(),
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
                List<StudyCategoriesRecord> containerStudyCategoriesRecordList =
                    snapshot.data!;
                return Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 44.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zdr2ssm7' /* Обучение */,
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
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '9f6fcpg0' /* от приложения IT BRAIN */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        if (containerStudyCategoriesRecordList.isNotEmpty)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final containerVar =
                                      containerStudyCategoriesRecordList
                                          .toList();
                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      100.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: containerVar.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 20.0),
                                    itemBuilder: (context, containerVarIndex) {
                                      final containerVarItem =
                                          containerVar[containerVarIndex];
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: StudyCompWidget(
                                          key: Key(
                                              'Keyffs_${containerVarIndex}_of_${containerVar.length}'),
                                          course: containerVarItem,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                );
              },
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navbarStudyModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: const NavbarStudyWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
