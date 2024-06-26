import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'book_timer_model.dart';
export 'book_timer_model.dart';

class BookTimerWidget extends StatefulWidget {
  const BookTimerWidget({
    super.key,
    required this.bookPages,
    required this.book,
  });

  final BooksPagesRecord? bookPages;
  final BookInfoRecord? book;

  @override
  State<BookTimerWidget> createState() => _BookTimerWidgetState();
}

class _BookTimerWidgetState extends State<BookTimerWidget> {
  late BookTimerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookTimerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookTimer'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_TIMER_PAGE_bookTimer_ON_INIT_STATE');
      logFirebaseEvent('bookTimer_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('bookTimer_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 10),
        callback: (timer) async {
          logFirebaseEvent('bookTimer_update_page_state');
          _model.progress = _model.progress + 0.01;
          setState(() {});
          if (_model.progress >= 1.0) {
            logFirebaseEvent('bookTimer_stop_periodic_action');
            _model.instantTimer?.cancel();
            logFirebaseEvent('bookTimer_navigate_to');

            context.pushNamed(
              'bookPageInfo',
              queryParameters: {
                'pageInfo': serializeParam(
                  widget.bookPages,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'pageInfo': widget.bookPages,
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            return;
          }
        },
        startImmediately: true,
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
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 500),
                fadeOutDuration: const Duration(milliseconds: 500),
                imageUrl: widget.bookPages!.photo,
                width: 300.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Frame_11818.png',
                  ).image,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 46.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOOK_TIMER_Container_jkgi69zy_ON_TAP');
                              logFirebaseEvent('Container_navigate_back');
                              context.safePop();
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Icon(
                                  FFIcons.kclose2,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              formatNumber(
                                _model.progress * 100,
                                formatType: FormatType.custom,
                                format: '',
                                locale: '',
                              ),
                              '0',
                            )} %',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'z425erss' /* Подбираем твою страницу на сег... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
