import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/meditation_comp/meditation_comp_widget.dart';
import '/main_pages/offline_mode/offline_mode_widget.dart';
import '/profile/affirmation_comp/affirmation_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 820.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().LastAffirmationDate !=
          dateTimeFormat(
            'd/M/y',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: AffirmationCompWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      if (FFAppState().isAppLoaded) {
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      _model.isIOnline = await actions.checkInternetConnection();
      if (_model.isIOnline!) {
        FFAppState().clearHomePageCacheCache();
        FFAppState().clearListViewCacheCache();
        FFAppState().clearMeditationCategoryPageCache();
        FFAppState().clearBuyPackCacheCache();
        FFAppState().clearHistoryCacheCache();
      } else {
        setState(() {
          FFAppState().isOffline = true;
          FFAppState().isAppLoaded = true;
        });
        return;
      }
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: FutureBuilder<List<StoriesRecord>>(
            future: FFAppState().homePageCache(
              requestFn: () => queryStoriesRecordOnce(),
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
              List<StoriesRecord> containerStoriesRecordList = snapshot.data!;
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Frame_11818.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 50.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'hx9gmzsn' /* Добро пожаловать! */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          fontSize: 17.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.41,
                                        ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.16,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('profileCabinet');
                                },
                                child: Builder(
                                  builder: (context) {
                                    if (currentUserPhoto != null &&
                                        currentUserPhoto != '') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: OctoImage(
                                          placeholderBuilder:
                                              OctoPlaceholder.blurHash(
                                            FFAppState().imageProfileBlurHash,
                                          ),
                                          image: CachedNetworkImageProvider(
                                            currentUserPhoto,
                                          ),
                                          width: 48.0,
                                          height: 48.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 48.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .nameSurnameFirstLetters(
                                                        currentUserDisplayName,
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.surname,
                                                            '')),
                                                '0',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Evolventa',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
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
                        if (!FFAppState().isOffline)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 24.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'searchPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x14FFFFFF),
                                    borderRadius: BorderRadius.circular(96.0),
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.search_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'wzo7tihb' /* Поиск */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                fontSize: 17.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!FFAppState().isOffline)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'x2dzs6sp' /* Что нового? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                if (!FFAppState().isOffline)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final stories =
                                            containerStoriesRecordList.toList();
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                stories.length, (storiesIndex) {
                                              final storiesItem =
                                                  stories[storiesIndex];
                                              return AuthUserStreamWidget(
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
                                                    context.pushNamed(
                                                      'Stories',
                                                      queryParameters: {
                                                        'stories':
                                                            serializeParam(
                                                          containerStoriesRecordList,
                                                          ParamType.Document,
                                                          true,
                                                        ),
                                                        'index': serializeParam(
                                                          storiesIndex,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'stories':
                                                            containerStoriesRecordList,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 72.0,
                                                    height: 72.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: (currentUserDocument
                                                                        ?.viewedStories
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    storiesItem
                                                                        .reference)
                                                            ? Color(0x00FE7110)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 64.0,
                                                        height: 64.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              storiesItem.image,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 6.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 20.0, 0.0),
                                  child: StreamBuilder<List<AffirmationRecord>>(
                                    stream: queryAffirmationRecord(
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AffirmationRecord>
                                          containerAffirmationRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerAffirmationRecord =
                                          containerAffirmationRecordList
                                                  .isNotEmpty
                                              ? containerAffirmationRecordList
                                                  .first
                                              : null;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        AffirmationCompWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .buttonColor2,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  FFIcons.kyoga,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'frx0mzd2' /* Послание дня */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        !FFAppState().isOffline
                                            ? FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Проекты',
                                                enText: 'Projects',
                                              )
                                            : FFLocalizations.of(context)
                                                .getVariableText(
                                                ruText: 'Офлайн режим',
                                                enText: 'Offline mode',
                                              ),
                                        'Медитации',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<MeditationCategoriesRecord>>(
                                  stream: FFAppState().listViewCache(
                                    requestFn: () =>
                                        queryMeditationCategoriesRecord(
                                      queryBuilder:
                                          (meditationCategoriesRecord) =>
                                              meditationCategoriesRecord
                                                  .orderBy('sort',
                                                      descending: true),
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
                                    List<MeditationCategoriesRecord>
                                        listViewMeditationCategoriesRecordList =
                                        snapshot.data!;
                                    if (listViewMeditationCategoriesRecordList
                                        .isEmpty) {
                                      return Container(
                                        height: 500.0,
                                        child: OfflineModeWidget(),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        70.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewMeditationCategoriesRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMeditationCategoriesRecord =
                                            listViewMeditationCategoriesRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'meditationInfo',
                                              queryParameters: {
                                                'meditationCategory':
                                                    serializeParam(
                                                  listViewMeditationCategoriesRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'meditationCategory':
                                                    listViewMeditationCategoriesRecord,
                                              },
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.meditationCompModels
                                                .getModel(
                                              listViewIndex.toString(),
                                              listViewIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: MeditationCompWidget(
                                              key: Key(
                                                'Key1vu_${listViewIndex.toString()}',
                                              ),
                                              meditationCategories:
                                                  listViewMeditationCategoriesRecord,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
