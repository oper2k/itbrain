import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditation_comp/meditation_comp_widget.dart';
import '/main_pages/offline_mode/offline_mode_widget.dart';
import '/navbar/navbar_home/navbar_home_widget.dart';
import '/profile/affirmation_comp/affirmation_comp_widget.dart';
import '/study/book_answer_comp/book_answer_comp_widget.dart';
import '/study/small_video_comp/small_video_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
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

  final animationsMap = <String, AnimationInfo>{};

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
        _model.affirmation = await actions.getRandomAffirmationReference();
        FFAppState().lastShowAffirmation = _model.affirmation?.reference;
        setState(() {});
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: AffirmationCompWidget(
                  affirmation: _model.affirmation!,
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
      await actions.lockOrientation();
      _model.isIOnline = await actions.checkInternetConnection();
      if (_model.isIOnline!) {
        FFAppState().clearListViewCacheCache();
        FFAppState().clearMeditationCategoryPageCache();
        FFAppState().clearBuyPackCacheCache();
        FFAppState().clearHistoryCacheCache();
      } else {
        FFAppState().isOffline = true;
        FFAppState().isAppLoaded = true;
        setState(() {});
        return;
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 820.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
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
          body: Stack(
            children: [
              FutureBuilder<List<StoriesRecord>>(
                future: queryStoriesRecordOnce(
                  queryBuilder: (storiesRecord) => storiesRecord
                      .where(
                        'lang',
                        isEqualTo: FFLocalizations.of(context).languageCode,
                      )
                      .orderBy('index'),
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
                  List<StoriesRecord> containerStoriesRecordList =
                      snapshot.data!;
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'hx9gmzsn' /* Добро пожаловать! */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.41,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
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
                                  ].divide(const SizedBox(height: 2.0)),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'profileCabinet',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Builder(
                                    builder: (context) {
                                      if (currentUserPhoto != '') {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: OctoImage(
                                            placeholderBuilder: (_) =>
                                                SizedBox.expand(
                                              child: Image(
                                                image: BlurHashImage(
                                                    FFAppState()
                                                        .imageProfileBlurHash),
                                                fit: BoxFit.cover,
                                              ),
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
                                                const AlignmentDirectional(0.0, 0.0),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!FFAppState().isOffline)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'x2dzs6sp' /* Что нового? */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (!FFAppState().isOffline)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final stories =
                                              containerStoriesRecordList
                                                  .toList();
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                      stories.length,
                                                      (storiesIndex) {
                                                final storiesItem =
                                                    stories[storiesIndex];
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (!(currentUserDocument
                                                                      ?.viewedStories
                                                                      .toList() ??
                                                                  [])
                                                              .contains(storiesItem
                                                                  .reference)) {
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'Stories',
                                                                  queryParameters:
                                                                      {
                                                                    'stories':
                                                                        serializeParam(
                                                                      containerStoriesRecordList,
                                                                      ParamType
                                                                          .Document,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'index':
                                                                        serializeParam(
                                                                      storiesIndex,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'stories':
                                                                        containerStoriesRecordList,
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 77.0,
                                                                height: 77.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF9747FF),
                                                                      Color(
                                                                          0xFFF1618E),
                                                                      Color(
                                                                          0xFFFE710B)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      0.6,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: (currentUserDocument?.viewedStories.toList() ??
                                                                                [])
                                                                            .contains(storiesItem
                                                                                .reference)
                                                                        ? const Color(
                                                                            0x00FE7110)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 72.0,
                                                                    height:
                                                                        72.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .buttonColor2,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            64.0,
                                                                        height:
                                                                            64.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          storiesItem
                                                                              .image,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'Stories',
                                                                    queryParameters:
                                                                        {
                                                                      'stories':
                                                                          serializeParam(
                                                                        containerStoriesRecordList,
                                                                        ParamType
                                                                            .Document,
                                                                        isList:
                                                                            true,
                                                                      ),
                                                                      'index':
                                                                          serializeParam(
                                                                        storiesIndex,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'stories':
                                                                          containerStoriesRecordList,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 77.0,
                                                                  height: 77.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: (currentUserDocument?.viewedStories.toList() ?? []).contains(storiesItem
                                                                              .reference)
                                                                          ? const Color(
                                                                              0x00FE7110)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .accent1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          72.0,
                                                                      height:
                                                                          72.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .buttonColor2,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                4.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                Container(
                                                                              width: 64.0,
                                                                              height: 64.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: const BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                storiesItem.image,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              ruText: storiesItem
                                                                  .homeTitle,
                                                              enText: storiesItem
                                                                  .homeTitleEng,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Evolventa',
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })
                                                  .divide(const SizedBox(width: 7.0))
                                                  .addToStart(
                                                      const SizedBox(width: 24.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 24.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 48.0, 0.0, 0.0),
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ShowAppleRecord>
                                          containerShowAppleRecordList =
                                          snapshot.data!;
                                      final containerShowAppleRecord =
                                          containerShowAppleRecordList
                                                  .isNotEmpty
                                              ? containerShowAppleRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: StreamBuilder<
                                              List<MeditationCategoriesRecord>>(
                                            stream: FFAppState().listViewCache(
                                              requestFn: () =>
                                                  queryMeditationCategoriesRecord(
                                                queryBuilder:
                                                    (meditationCategoriesRecord) =>
                                                        meditationCategoriesRecord
                                                            .orderBy('sort'),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                return const SizedBox(
                                                  height: 500.0,
                                                  child: OfflineModeWidget(),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewMeditationCategoriesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewMeditationCategoriesRecord =
                                                      listViewMeditationCategoriesRecordList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible: (!containerShowAppleRecord!
                                                                .isShow3 &&
                                                            listViewMeditationCategoriesRecord
                                                                .isPaid) ||
                                                        (!containerShowAppleRecord
                                                                .isShow3 &&
                                                            !listViewMeditationCategoriesRecord
                                                                .soon) ||
                                                        containerShowAppleRecord
                                                            .isShow3,
                                                    child: InkWell(
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
                                                          'meditationInfo',
                                                          queryParameters: {
                                                            'meditationCategory':
                                                                serializeParam(
                                                              listViewMeditationCategoriesRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'meditationCategory':
                                                                listViewMeditationCategoriesRecord,
                                                          },
                                                        );
                                                      },
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .meditationCompModels
                                                            .getModel(
                                                          listViewIndex
                                                              .toString(),
                                                          listViewIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            MeditationCompWidget(
                                                          key: Key(
                                                            'Keyr1a_${listViewIndex.toString()}',
                                                          ),
                                                          meditationCategories:
                                                              listViewMeditationCategoriesRecord,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 36.0, 24.0, 0.0),
                                    child: StreamBuilder<List<BookInfoRecord>>(
                                      stream: queryBookInfoRecord(
                                        queryBuilder: (bookInfoRecord) =>
                                            bookInfoRecord.where(
                                          'lang',
                                          isEqualTo: FFLocalizations.of(context)
                                              .languageCode,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BookInfoRecord>
                                            listViewBookInfoRecordList =
                                            snapshot.data!;
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewBookInfoRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 20.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewBookInfoRecord =
                                                listViewBookInfoRecordList[
                                                    listViewIndex];
                                            return BookAnswerCompWidget(
                                              key: Key(
                                                  'Keyyg1_${listViewIndex}_of_${listViewBookInfoRecordList.length}'),
                                              book: listViewBookInfoRecord,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 32.0, 20.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('allVideos');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jzorskdy' /* Видео */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<List<VideosRecord>>(
                                        stream: queryVideosRecord(
                                          queryBuilder: (videosRecord) =>
                                              videosRecord
                                                  .where(
                                                    'lang',
                                                    isEqualTo:
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                  )
                                                  .orderBy('order'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<VideosRecord>
                                              containerVideosRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final videos =
                                                    containerVideosRecordList
                                                        .toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        videos.length,
                                                        (videosIndex) {
                                                      final videosItem =
                                                          videos[videosIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await launchURL(
                                                              videosItem
                                                                  .videoUrl);
                                                        },
                                                        child: Container(
                                                          width: 160.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          child:
                                                              SmallVideoCompWidget(
                                                            key: Key(
                                                                'Key6i6_${videosIndex}_of_${videos.length}'),
                                                            video: videosItem,
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(width: 12.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().lastShowAffirmation != null)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 0.0),
                                      child: StreamBuilder<AffirmationRecord>(
                                        stream: AffirmationRecord.getDocument(
                                            FFAppState().lastShowAffirmation!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final containerAffirmationRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          AffirmationCompWidget(
                                                        affirmation:
                                                            containerAffirmationRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .buttonColor2,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FFIcons.kyoga,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      size: 24.0,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'frx0mzd2' /* Послание дня */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Evolventa',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                ].addToEnd(const SizedBox(height: 100.0)),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!),
                          ),
                        ].addToStart(const SizedBox(height: 50.0)),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!);
                },
              ),
              wrapWithModel(
                model: _model.navbarHomeModel,
                updateCallback: () => setState(() {}),
                child: const NavbarHomeWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
