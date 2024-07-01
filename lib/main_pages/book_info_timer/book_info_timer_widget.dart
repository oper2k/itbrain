import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'book_info_timer_model.dart';
export 'book_info_timer_model.dart';

class BookInfoTimerWidget extends StatefulWidget {
  const BookInfoTimerWidget({
    super.key,
    required this.book,
  });

  final BookInfoRecord? book;

  @override
  State<BookInfoTimerWidget> createState() => _BookInfoTimerWidgetState();
}

class _BookInfoTimerWidgetState extends State<BookInfoTimerWidget> {
  late BookInfoTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookInfoTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_INFO_TIMER_bookInfoTimer_ON_INIT_ST');
      logFirebaseEvent('bookInfoTimer_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 100),
        callback: (timer) async {
          logFirebaseEvent('bookInfoTimer_update_component_state');
          _model.progress = _model.progress + 0.1;
          setState(() {});
          if (_model.progress >= 1.0) {
            logFirebaseEvent('bookInfoTimer_stop_periodic_action');
            _model.instantTimer?.cancel();
            logFirebaseEvent('bookInfoTimer_bottom_sheet');
            Navigator.pop(context);
            logFirebaseEvent('bookInfoTimer_firestore_query');
            _model.allPages = await queryBooksPagesRecordOnce(
              queryBuilder: (booksPagesRecord) => booksPagesRecord.where(
                'book',
                isEqualTo: widget.book?.reference,
              ),
            );
            logFirebaseEvent('bookInfoTimer_navigate_to');

            context.pushNamed(
              'bookPageInfo',
              queryParameters: {
                'pageInfo': serializeParam(
                  functions.listShuffleBooks(_model.allPages!.toList()),
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'pageInfo':
                    functions.listShuffleBooks(_model.allPages!.toList()),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 46.0),
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
                          'BOOK_INFO_TIMER_Container_vnl223ij_ON_TA');
                      logFirebaseEvent('Container_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Icon(
                          FFIcons.kclose2,
                          color: FlutterFlowTheme.of(context).primaryText,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      '81k519jd' /* Подбираем твою страницу на сег... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
    );
  }
}
