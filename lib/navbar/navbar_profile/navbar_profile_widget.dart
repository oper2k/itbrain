import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navbar_profile_model.dart';
export 'navbar_profile_model.dart';

class NavbarProfileWidget extends StatefulWidget {
  const NavbarProfileWidget({super.key});

  @override
  State<NavbarProfileWidget> createState() => _NavbarProfileWidgetState();
}

class _NavbarProfileWidgetState extends State<NavbarProfileWidget> {
  late NavbarProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarProfileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 84.0,
        decoration: BoxDecoration(
          color: const Color(0xFF2F0A4C),
          border: Border.all(
            color: const Color(0x1FFFFFFF),
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(42.0, 7.0, 42.0, 0.0),
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
                    logFirebaseEvent('NAVBAR_PROFILE_Column_79q7hfi9_ON_TAP');
                    logFirebaseEvent('Column_navigate_to');

                    context.pushNamed(
                      'HomePage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Icon(
                          FFIcons.kdmtHome,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '9z7ozp98' /* Главная */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Evolventa',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<ShowAppleRecord>>(
                  stream: queryShowAppleRecord(
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
                    List<ShowAppleRecord> containerShowAppleRecordList =
                        snapshot.data!;
                    final containerShowAppleRecord =
                        containerShowAppleRecordList.isNotEmpty
                            ? containerShowAppleRecordList.first
                            : null;
                    return Container(
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: containerShowAppleRecord?.isShow3 ?? true,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'NAVBAR_PROFILE_Column_4kxa8w10_ON_TAP');
                            logFirebaseEvent('Column_navigate_to');

                            context.pushNamed(
                              'studyPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                FFIcons.kdmtStudy,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '3jhy5596' /* Обучение */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FFIcons.kdmtUser1,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ljdwndwc' /* Профиль */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
