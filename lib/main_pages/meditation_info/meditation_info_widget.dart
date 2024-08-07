import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/main_pages/meditations_offline/meditations_offline_widget.dart';
import '/profile/is_deleted/is_deleted_widget.dart';
import '/profile/is_downloaded_all/is_downloaded_all_widget.dart';
import '/study/meditation_pack_info/meditation_pack_info_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'meditation_info_model.dart';
export 'meditation_info_model.dart';

class MeditationInfoWidget extends StatefulWidget {
  const MeditationInfoWidget({
    super.key,
    required this.meditationCategory,
  });

  final MeditationCategoriesRecord? meditationCategory;

  @override
  State<MeditationInfoWidget> createState() => _MeditationInfoWidgetState();
}

class _MeditationInfoWidgetState extends State<MeditationInfoWidget>
    with TickerProviderStateMixin {
  late MeditationInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationInfoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'meditationInfo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MEDITATION_INFO_meditationInfo_ON_INIT_S');
      logFirebaseEvent('meditationInfo_custom_action');
      await actions.notCreateScreenshots();
      logFirebaseEvent('meditationInfo_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('meditationInfo_custom_action');
      unawaited(
        () async {
          await actions.stopMusic(
            'p1',
          );
        }(),
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 600.0.ms,
            color: Colors.white,
            angle: 0.524,
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<MeditationsRecord>>(
          stream: FFAppState().meditationCategoryPage(
            uniqueQueryKey: widget.meditationCategory?.reference.id,
            requestFn: () => queryMeditationsRecord(
              queryBuilder: (meditationsRecord) => meditationsRecord
                  .where(
                    'meditationCategory',
                    isEqualTo: widget.meditationCategory?.reference,
                  )
                  .where(
                    'lang',
                    isEqualTo: FFLocalizations.of(context).languageCode,
                  )
                  .orderBy('order'),
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
            List<MeditationsRecord> containerMeditationsRecordList =
                snapshot.data!;

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
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/2vqf7_',
                              ).image,
                            ),
                          ),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            children: [
                              CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl:
                                    widget.meditationCategory!.cetegoryCover,
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
                                          logFirebaseEvent(
                                              'MEDITATION_INFO_Container_8yqwlyga_ON_TA');
                                          logFirebaseEvent(
                                              'Container_navigate_back');
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
                                      if ((_model.downloadProgress! > 0) &&
                                          (_model.downloadProgress != 100))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              '${_model.downloadProgress?.toString()}% из 100%',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      if ((currentUserDocument
                                                  ?.purchasedMeditationsPacks
                                                  .toList() ??
                                              [])
                                          .contains(widget
                                              .meditationCategory?.reference))
                                        AuthUserStreamWidget(
                                          builder: (context) => SizedBox(
                                            width: 44.0,
                                            height: 44.0,
                                            child: Stack(
                                              children: [
                                                if ((FFAppState()
                                                            .downloadedTracks
                                                            .where((e) =>
                                                                e.category ==
                                                                widget
                                                                    .meditationCategory
                                                                    ?.reference
                                                                    .id)
                                                            .toList()
                                                            .length >=
                                                        containerMeditationsRecordList
                                                            .length) &&
                                                    ((_model.downloadProgress
                                                                .toString() ==
                                                            '0') ||
                                                        (_model.downloadProgress ==
                                                            100)))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'MEDITATION_INFO_PAGE_RemoveAllBtn_ON_TAP');
                                                      while (_model
                                                              .iterationIndex <
                                                          containerMeditationsRecordList
                                                              .length) {
                                                        logFirebaseEvent(
                                                            'RemoveAllBtn_custom_action');
                                                        _model.isDeleted =
                                                            await actions
                                                                .deleteFiles(
                                                          functions.findTrackById(
                                                              containerMeditationsRecordList[
                                                                      _model
                                                                          .iterationIndex]
                                                                  .reference
                                                                  .id,
                                                              FFAppState()
                                                                  .downloadedTracks
                                                                  .toList()),
                                                        );
                                                        logFirebaseEvent(
                                                            'RemoveAllBtn_update_page_state');
                                                        _model.iterationIndex =
                                                            _model.iterationIndex +
                                                                1;
                                                        setState(() {});
                                                      }
                                                      logFirebaseEvent(
                                                          'RemoveAllBtn_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  const IsDeletedWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      logFirebaseEvent(
                                                          'RemoveAllBtn_update_page_state');
                                                      _model.iterationIndex = 0;
                                                      setState(() {});

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 44.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .arrowCircleDown,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .downloadedTracks
                                                            .where((e) =>
                                                                e.category ==
                                                                widget
                                                                    .meditationCategory
                                                                    ?.reference
                                                                    .id)
                                                            .toList()
                                                            .length <
                                                        containerMeditationsRecordList
                                                            .length) &&
                                                    ((_model.downloadProgress ==
                                                            0) ||
                                                        (_model.downloadProgress ==
                                                            100)))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'MEDITATION_INFO_DownloadAllBtn_ON_TAP');
                                                      logFirebaseEvent(
                                                          'DownloadAllBtn_update_page_state');
                                                      _model.downloadProgress =
                                                          5;
                                                      setState(() {});
                                                      while (_model
                                                              .iterationIndex <
                                                          containerMeditationsRecordList
                                                              .length) {
                                                        logFirebaseEvent(
                                                            'DownloadAllBtn_custom_action');
                                                        _model.isDownload =
                                                            await actions
                                                                .downloadUrl(
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .reference
                                                              .id,
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .audioPath,
                                                          containerMeditationsRecordList[
                                                                  _model
                                                                      .iterationIndex]
                                                              .image,
                                                        );
                                                        if (_model
                                                            .isDownload!) {
                                                          logFirebaseEvent(
                                                              'DownloadAllBtn_update_app_state');
                                                          FFAppState()
                                                              .updateDownloadedTracksAtIndex(
                                                            valueOrDefault<int>(
                                                                  FFAppState()
                                                                      .downloadedTracks
                                                                      .length,
                                                                  1,
                                                                ) -
                                                                1,
                                                            (e) => e
                                                              ..name =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .title
                                                              ..description =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .description
                                                              ..audioPath =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .audioPath
                                                              ..isPaid =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .isPaid
                                                              ..duration =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .duration
                                                              ..type =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .type
                                                              ..category =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .meditationCategory
                                                                      ?.id
                                                              ..meditationCategorg =
                                                                  widget
                                                                      .meditationCategory
                                                                      ?.reference
                                                              ..nameEng =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .titleEng
                                                              ..descriptionName =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .descriptionEng
                                                              ..durationEng =
                                                                  containerMeditationsRecordList[
                                                                          _model
                                                                              .iterationIndex]
                                                                      .durationEng,
                                                          );
                                                        }
                                                        logFirebaseEvent(
                                                            'DownloadAllBtn_update_page_state');
                                                        _model.iterationIndex =
                                                            _model.iterationIndex +
                                                                1;
                                                        _model.downloadProgress =
                                                            (100 /
                                                                    containerMeditationsRecordList
                                                                        .length)
                                                                .round();
                                                        setState(() {});
                                                      }
                                                      logFirebaseEvent(
                                                          'DownloadAllBtn_update_page_state');
                                                      _model.iterationIndex = 0;
                                                      _model.downloadProgress =
                                                          100;
                                                      setState(() {});
                                                      logFirebaseEvent(
                                                          'DownloadAllBtn_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  const IsDownloadedAllWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 44.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          FFIcons.kshare3,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 32.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((_model.downloadProgress! >
                                                        0) &&
                                                    (_model.downloadProgress !=
                                                        100))
                                                  Container(
                                                    width: 40.0,
                                                    height: 44.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .downloading_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 26.0,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation']!),
                                              ],
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
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                                  ruText:
                                      widget.meditationCategory?.nameCategory,
                                  enText: widget
                                      .meditationCategory?.nameCategoryEng,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Stack(
                              alignment: const AlignmentDirectional(1.0, 1.0),
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              ruText: widget.meditationCategory
                                                  ?.descriptionCategory,
                                              enText: widget.meditationCategory
                                                  ?.descriptionCategoryEng,
                                            ),
                                            '0',
                                          ).maybeHandleOverflow(
                                            maxChars: 170,
                                            replacement: '…',
                                          ),
                                          maxLines: valueOrDefault<int>(
                                            MediaQuery.sizeOf(context).width <
                                                    340.0
                                                ? 4
                                                : 10,
                                            10,
                                          ),
                                          minFontSize: 14.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.29,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'MEDITATION_INFO_Container_ypbu3s9h_ON_TA');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      MeditationPackInfoWidget(
                                                    title: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      ruText: widget
                                                          .meditationCategory
                                                          ?.nameCategory,
                                                      enText: widget
                                                          .meditationCategory
                                                          ?.nameCategoryEng,
                                                    ),
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      ruText: widget
                                                          .meditationCategory
                                                          ?.descriptionCategory,
                                                      enText: widget
                                                          .meditationCategory
                                                          ?.descriptionCategoryEng,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                                const Color(0x00370C59)
                                              ],
                                              stops: const [0.8, 1.0],
                                              begin: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              end:
                                                  const AlignmentDirectional(-1.0, 0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vvpwce3u' /* eщё */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          (MediaQuery.sizeOf(context)
                                                                          .width <
                                                                      340.0
                                                                  ? 14
                                                                  : 17)
                                                              .toDouble(),
                                                          17.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.41,
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
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (widget.meditationCategory?.soon ?? false) {
                                return Builder(
                                  builder: (context) {
                                    if (widget.meditationCategory
                                            ?.showNotifyButton ??
                                        false) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (!(currentUserDocument?.addedInPush
                                                      .toList() ??
                                                  [])
                                              .contains(widget
                                                  .meditationCategory
                                                  ?.reference))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'MEDITATION_INFO_soon_showNotify_notAdded');
                                                    logFirebaseEvent(
                                                        'soon_showNotify_notAdded_backend_call');

                                                    var ffCustomPushNotificationsRecordReference =
                                                        FfCustomPushNotificationsRecord
                                                            .collection
                                                            .doc();
                                                    await ffCustomPushNotificationsRecordReference
                                                        .set(
                                                            createFfCustomPushNotificationsRecordData(
                                                      tag: '',
                                                      isRepeat: false,
                                                      repeatInterval: '',
                                                      status: 'started',
                                                      targetAudience: 'All',
                                                      userRefs:
                                                          currentUserReference
                                                              ?.id,
                                                      variable: '',
                                                      parameterData: '',
                                                      notificationTitle:
                                                          '${FFLocalizations.of(context).getVariableText(
                                                        ruText: 'Проект',
                                                        enText: 'Project',
                                                      )}\"${FFLocalizations.of(context).getVariableText(
                                                        ruText: widget
                                                            .meditationCategory
                                                            ?.nameCategory,
                                                        enText: widget
                                                            .meditationCategory
                                                            ?.nameCategoryEng,
                                                      )}\"${FFLocalizations.of(context).getVariableText(
                                                        ruText:
                                                            ' теперь доступен!',
                                                        enText:
                                                            'is avaliable now!',
                                                      )}',
                                                      notificationText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        ruText:
                                                            'Зайди, чтобы проверить!',
                                                        enText:
                                                            'Click to check!',
                                                      ),
                                                      condition: '',
                                                      conditionValue: '',
                                                      initialPageName:
                                                          'HomePage',
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      scheduledTime: widget
                                                          .meditationCategory
                                                          ?.startDate,
                                                      notificationImageUrl: '',
                                                    ));
                                                    _model.meditationPackNotify =
                                                        FfCustomPushNotificationsRecord
                                                            .getDocumentFromData(
                                                                createFfCustomPushNotificationsRecordData(
                                                                  tag: '',
                                                                  isRepeat:
                                                                      false,
                                                                  repeatInterval:
                                                                      '',
                                                                  status:
                                                                      'started',
                                                                  targetAudience:
                                                                      'All',
                                                                  userRefs:
                                                                      currentUserReference
                                                                          ?.id,
                                                                  variable: '',
                                                                  parameterData:
                                                                      '',
                                                                  notificationTitle:
                                                                      '${FFLocalizations.of(context).getVariableText(
                                                                    ruText:
                                                                        'Проект',
                                                                    enText:
                                                                        'Project',
                                                                  )}\"${FFLocalizations.of(context).getVariableText(
                                                                    ruText: widget
                                                                        .meditationCategory
                                                                        ?.nameCategory,
                                                                    enText: widget
                                                                        .meditationCategory
                                                                        ?.nameCategoryEng,
                                                                  )}\"${FFLocalizations.of(context).getVariableText(
                                                                    ruText:
                                                                        ' теперь доступен!',
                                                                    enText:
                                                                        'is avaliable now!',
                                                                  )}',
                                                                  notificationText:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    ruText:
                                                                        'Зайди, чтобы проверить!',
                                                                    enText:
                                                                        'Click to check!',
                                                                  ),
                                                                  condition: '',
                                                                  conditionValue:
                                                                      '',
                                                                  initialPageName:
                                                                      'HomePage',
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  scheduledTime: widget
                                                                      .meditationCategory
                                                                      ?.startDate,
                                                                  notificationImageUrl:
                                                                      '',
                                                                ),
                                                                ffCustomPushNotificationsRecordReference);
                                                    logFirebaseEvent(
                                                        'soon_showNotify_notAdded_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'added_in_push':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget
                                                                .meditationCategory
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'soon_showNotify_notAdded_wait__delay');
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500));

                                                    setState(() {});
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
                                                        begin:
                                                            AlignmentDirectional(
                                                                1.0, 0.34),
                                                        end:
                                                            AlignmentDirectional(
                                                                -1.0, -0.34),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2kma94hw' /* Напомнить об открытии продаж */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Evolventa',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if ((currentUserDocument?.addedInPush
                                                      .toList() ??
                                                  [])
                                              .contains(widget
                                                  .meditationCategory
                                                  ?.reference))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  width: double.infinity,
                                                  height: 52.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'khaivu00' /* Вы подписались на уведомления */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Evolventa',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MEDITATION_INFO_soon_notShowNotify_ON_TA');
                                            logFirebaseEvent(
                                                'soon_notShowNotify_launch_u_r_l');
                                            await launchURL(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              ruText: widget.meditationCategory
                                                  ?.getCourseUrl,
                                              enText: widget.meditationCategory
                                                  ?.getCourseUrlEng,
                                            ));
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
                                                begin: AlignmentDirectional(
                                                    1.0, 0.34),
                                                end: AlignmentDirectional(
                                                    -1.0, -0.34),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kya3o4nc' /* Узнать подробнее */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Visibility(
                                  visible: ((!(currentUserDocument
                                                          ?.purchasedMeditationsPacks
                                                          .toList() ??
                                                      [])
                                                  .contains(widget
                                                      .meditationCategory
                                                      ?.reference) &&
                                              !FFAppState().isOffline) &&
                                          !widget.meditationCategory!.free) &&
                                      !widget.meditationCategory!.soon,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'MEDITATION_INFO_noSoon_notPurchased_ON_T');
                                          logFirebaseEvent(
                                              'noSoon_notPurchased_launch_u_r_l');
                                          await launchURL(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            ruText: widget.meditationCategory
                                                ?.getCourseUrl,
                                            enText: widget.meditationCategory
                                                ?.getCourseUrlEng,
                                          ));
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
                                              begin: AlignmentDirectional(
                                                  1.0, 0.34),
                                              end: AlignmentDirectional(
                                                  -1.0, -0.34),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lspc264o' /* Узнать больше и купить */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          if (containerMeditationsRecordList.isNotEmpty)
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 28.0, 0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    containerMeditationsRecordList.length
                                        .toString(),
                                    '0',
                                  )}${FFLocalizations.of(context).getVariableText(
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
                          Builder(
                            builder: (context) {
                              if (!FFAppState().isOffline) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 32.0),
                                  child: Builder(
                                    builder: (context) {
                                      final meditations =
                                          containerMeditationsRecordList
                                              .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: meditations.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 36.0),
                                        itemBuilder:
                                            (context, meditationsIndex) {
                                          final meditationsItem =
                                              meditations[meditationsIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MEDITATION_INFO_Container_bv2ljgco_ON_TA');
                                                  if (meditationsItem.isPaid) {
                                                    if ((currentUserDocument
                                                                ?.purchasedMeditationsPacks
                                                                .toList() ??
                                                            [])
                                                        .contains(meditationsItem
                                                            .meditationCategory)) {
                                                      logFirebaseEvent(
                                                          'meditations_update_app_state');
                                                      FFAppState().positionMS =
                                                          0;
                                                      FFAppState().playerIndex =
                                                          valueOrDefault<int>(
                                                        meditationsIndex,
                                                        0,
                                                      );
                                                      setState(() {});
                                                      logFirebaseEvent(
                                                          'meditations_custom_action');
                                                      await actions.stopMusic(
                                                        'p1',
                                                      );
                                                      logFirebaseEvent(
                                                          'meditations_navigate_to');

                                                      context.pushNamed(
                                                        'playerPage',
                                                        queryParameters: {
                                                          'audio':
                                                              serializeParam(
                                                            containerMeditationsRecordList,
                                                            ParamType.Document,
                                                            isList: true,
                                                          ),
                                                          'medCategory':
                                                              serializeParam(
                                                            meditationsItem
                                                                .meditationCategory,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'meditation':
                                                              serializeParam(
                                                            widget
                                                                .meditationCategory,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'audio':
                                                              containerMeditationsRecordList,
                                                          'meditation': widget
                                                              .meditationCategory,
                                                        },
                                                      );

                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'meditations_update_app_state');
                                                    FFAppState().positionMS = 0;
                                                    FFAppState().playerIndex =
                                                        meditationsIndex;
                                                    setState(() {});
                                                    logFirebaseEvent(
                                                        'meditations_custom_action');
                                                    await actions.stopMusic(
                                                      'p1',
                                                    );
                                                    logFirebaseEvent(
                                                        'meditations_navigate_to');

                                                    context.pushNamed(
                                                      'playerPage',
                                                      queryParameters: {
                                                        'audio': serializeParam(
                                                          containerMeditationsRecordList,
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                        'medCategory':
                                                            serializeParam(
                                                          meditationsItem
                                                              .meditationCategory,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'meditation':
                                                            serializeParam(
                                                          widget
                                                              .meditationCategory,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'audio':
                                                            containerMeditationsRecordList,
                                                        'meditation': widget
                                                            .meditationCategory,
                                                      },
                                                    );

                                                    return;
                                                  }
                                                },
                                                child: MeditationsWidget(
                                                  key: Key(
                                                      'Keybv2_${meditationsIndex}_of_${meditations.length}'),
                                                  meditation: meditationsItem,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final offline = FFAppState()
                                          .downloadedTracks
                                          .where((e) =>
                                              e.meditationCategorg ==
                                              widget.meditationCategory
                                                  ?.reference)
                                          .toList();

                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          36.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: offline.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 36.0),
                                        itemBuilder: (context, offlineIndex) {
                                          final offlineItem =
                                              offline[offlineIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MEDITATION_INFO_Container_jq7f49e4_ON_TA');
                                                logFirebaseEvent(
                                                    'meditationsOffline_navigate_to');

                                                context.pushNamed(
                                                  'offlinePlayerPage',
                                                  queryParameters: {
                                                    'currentAudioIndex':
                                                        serializeParam(
                                                      offlineIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: MeditationsOfflineWidget(
                                                key: Key(
                                                    'Keyjq7_${offlineIndex}_of_${offline.length}'),
                                                indexInList: offlineIndex,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ].addToEnd(const SizedBox(height: 32.0)),
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
