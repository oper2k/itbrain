import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbar/navbar_study/navbar_study_widget.dart';
import '/study/study_comp/study_comp_widget.dart';
import 'package:flutter/material.dart';
import 'study_page_model.dart';
export 'study_page_model.dart';

class StudyPageWidget extends StatefulWidget {
  const StudyPageWidget({super.key});

  @override
  State<StudyPageWidget> createState() => _StudyPageWidgetState();
}

class _StudyPageWidgetState extends State<StudyPageWidget> {
  late StudyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyPageModel());
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 44.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zdr2ssm7' /* Обучение */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: StreamBuilder<List<StudyCategoriesRecord>>(
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
                          List<StudyCategoriesRecord>
                              listViewStudyCategoriesRecordList =
                              snapshot.data!;
                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              100.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewStudyCategoriesRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewStudyCategoriesRecord =
                                  listViewStudyCategoriesRecordList[
                                      listViewIndex];
                              return StreamBuilder<List<LevelsRecord>>(
                                stream: queryLevelsRecord(
                                  queryBuilder: (levelsRecord) =>
                                      levelsRecord.where(
                                    'course_ref',
                                    isEqualTo:
                                        listViewStudyCategoriesRecord.reference,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<LevelsRecord> containerLevelsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: StudyCompWidget(
                                      key: Key(
                                          'Keyffs_${listViewIndex}_of_${listViewStudyCategoriesRecordList.length}'),
                                      course: listViewStudyCategoriesRecord,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
