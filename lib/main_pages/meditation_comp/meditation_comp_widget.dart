import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'meditation_comp_model.dart';
export 'meditation_comp_model.dart';

class MeditationCompWidget extends StatefulWidget {
  const MeditationCompWidget({
    super.key,
    required this.meditationCategories,
  });

  final MeditationCategoriesRecord? meditationCategories;

  @override
  State<MeditationCompWidget> createState() => _MeditationCompWidgetState();
}

class _MeditationCompWidgetState extends State<MeditationCompWidget> {
  late MeditationCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (!widget.meditationCategories!.soon) {
            context.pushNamed(
              'meditationInfo',
              queryParameters: {
                'meditationCategory': serializeParam(
                  widget.meditationCategories,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'meditationCategory': widget.meditationCategories,
              },
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: 152.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: () {
                                if ((currentUserDocument
                                            ?.purchasedMeditationsPacks
                                            .toList() ??
                                        [])
                                    .contains(widget
                                        .meditationCategories?.reference)) {
                                  return FlutterFlowTheme.of(context).accent1;
                                } else if (widget.meditationCategories!.free) {
                                  return FlutterFlowTheme.of(context).accent1;
                                } else if (widget.meditationCategories!.soon) {
                                  return Colors.transparent;
                                } else {
                                  return Colors.transparent;
                                }
                              }(),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).buttonColor,
                            boxShadow: [
                              BoxShadow(
                                color: (currentUserDocument
                                                ?.purchasedMeditationsPacks
                                                .toList() ??
                                            [])
                                        .contains(widget
                                            .meditationCategories?.reference)
                                    ? FlutterFlowTheme.of(context).accent1
                                    : Colors.transparent,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: () {
                                if ((currentUserDocument
                                            ?.purchasedMeditationsPacks
                                            .toList() ??
                                        [])
                                    .contains(widget
                                        .meditationCategories?.reference)) {
                                  return FlutterFlowTheme.of(context).accent1;
                                } else if (widget.meditationCategories!.free) {
                                  return FlutterFlowTheme.of(context).accent1;
                                } else if (widget.meditationCategories!.soon) {
                                  return Colors.transparent;
                                } else {
                                  return Colors.transparent;
                                }
                              }(),
                              width: 2.0,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: widget.meditationCategories
                                              ?.nameCategory,
                                          enText: widget.meditationCategories
                                              ?.nameCategoryEng,
                                        ),
                                        'audioMeditation',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            color: widget
                                                    .meditationCategories!.soon
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.29,
                                          ),
                                    ),
                                    if (widget.meditationCategories
                                            ?.showAudioCount ??
                                        true)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          '${valueOrDefault<String>(
                                            widget.meditationCategories?.count
                                                .toString(),
                                            '0',
                                          )}${valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              ruText: ' Аудиозаписей',
                                              enText: ' audios',
                                            ),
                                            ' 0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                color: widget
                                                        .meditationCategories!
                                                        .soon
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageUrl: widget.meditationCategories!.categoryPhoto,
                    width: 147.0,
                    height: 148.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(
                children: [
                  if ((currentUserDocument?.purchasedMeditationsPacks
                              .toList() ??
                          [])
                      .contains(widget.meditationCategories?.reference))
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 83.0,
                            height: 24.0,
                            constraints: const BoxConstraints(
                              minWidth: 83.0,
                              maxWidth: 95.0,
                            ),
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
                                  'c0orjo43' /* КУПЛЕНО */,
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
                  if (widget.meditationCategories!.soon &&
                      !widget.meditationCategories!.free)
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 70.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF552F72),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0ko1m2ax' /* СКОРО */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: const Color(0xB2FFFFFF),
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
                  if (widget.meditationCategories?.free ?? true)
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 99.0,
                          height: 24.0,
                          constraints: const BoxConstraints(
                            minWidth: 83.0,
                            maxWidth: 95.0,
                          ),
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
                                'jvntpdkz' /* БЕСПЛАТНО */,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
