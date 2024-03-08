import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'is_not_downloaded_model.dart';
export 'is_not_downloaded_model.dart';

class IsNotDownloadedWidget extends StatefulWidget {
  const IsNotDownloadedWidget({super.key});

  @override
  State<IsNotDownloadedWidget> createState() => _IsNotDownloadedWidgetState();
}

class _IsNotDownloadedWidgetState extends State<IsNotDownloadedWidget> {
  late IsNotDownloadedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IsNotDownloadedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).thirdBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 0.0,
                    buttonSize: 38.0,
                    fillColor: FlutterFlowTheme.of(context).buttonColor,
                    icon: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 22.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'cv88anl1' /* Медитация не загружена */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'zbt927dh' /* Медитация не загружена! Произо... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                            lineHeight: 1.41,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 49.0, 0.0, 46.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'oje46arq' /* Хорошо */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 15.0,
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
      ),
    );
  }
}
