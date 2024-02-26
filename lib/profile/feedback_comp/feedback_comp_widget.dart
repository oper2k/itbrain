import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/confirmed_feedback/confirmed_feedback_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feedback_comp_model.dart';
export 'feedback_comp_model.dart';

class FeedbackCompWidget extends StatefulWidget {
  const FeedbackCompWidget({super.key});

  @override
  State<FeedbackCompWidget> createState() => _FeedbackCompWidgetState();
}

class _FeedbackCompWidgetState extends State<FeedbackCompWidget> {
  late FeedbackCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackCompModel());

    _model.feedbackController ??= TextEditingController();
    _model.feedbackFocusNode ??= FocusNode();
    _model.feedbackFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).thirdBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 46.0),
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
                    fillColor: FlutterFlowTheme.of(context).alternate,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '48k4wst9' /* Напишите, что не нравится */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Evolventa',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '62p8lzo3' /* Мы прислушиваемся к каждому от... */,
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: (_model.feedbackFocusNode?.hasFocus ?? false)
                            ? FlutterFlowTheme.of(context).accent1
                            : Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                      child: TextFormField(
                        controller: _model.feedbackController,
                        focusNode: _model.feedbackFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.feedbackController',
                          Duration(milliseconds: 500),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'mc1vs16p' /* Ваш отзыв */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Evolventa',
                                color: (_model.feedbackFocusNode?.hasFocus ??
                                        false)
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                fontSize: 17.0,
                                useGoogleFonts: false,
                                lineHeight: 1.0,
                              ),
                          alignLabelWithHint: false,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          errorStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Evolventa',
                                    color: FlutterFlowTheme.of(context).error,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 17.0, 0.0, 17.0),
                          suffixIcon: _model.feedbackController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.feedbackController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              fontSize: 17.0,
                              useGoogleFonts: false,
                              lineHeight: 1.0,
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 6,
                        minLines: 1,
                        maxLength: 500,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        keyboardType: TextInputType.multiline,
                        cursorColor: FlutterFlowTheme.of(context).accent1,
                        validator: _model.feedbackControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 79.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.feedbackController.text != null &&
                        _model.feedbackController.text != '') {
                      await FeedbacksRecord.collection
                          .doc()
                          .set(createFeedbacksRecordData(
                            text: _model.feedbackController.text,
                            userCreator: currentUserReference,
                          ));
                      Navigator.pop(context);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0xCC1E071C),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ConfirmedFeedbackWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      Navigator.pop(context);
                    }
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
                        begin: AlignmentDirectional(1.0, 0.34),
                        end: AlignmentDirectional(-1.0, -0.34),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'zxvth5hs' /* Отправить отзыв */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
      ),
    );
  }
}
