import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/content_block/content_block_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'content_page_model.dart';
export 'content_page_model.dart';

class ContentPageWidget extends StatefulWidget {
  const ContentPageWidget({
    super.key,
    required this.lesson,
    bool? isLastLesson,
    required this.level,
  }) : isLastLesson = isLastLesson ?? false;

  final LessonsRecord? lesson;
  final bool isLastLesson;
  final LevelsRecord? level;

  @override
  State<ContentPageWidget> createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget> {
  late ContentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'contentPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTENT_contentPage_ON_INIT_STATE');
      logFirebaseEvent('contentPage_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('contentPage_custom_action');
      await actions.notCreateScreenshots();
      if (!(currentUserDocument?.completeLessons.toList() ?? [])
          .contains(widget.lesson?.reference)) {
        if (widget.isLastLesson) {
          logFirebaseEvent('contentPage_backend_call');

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'completeLessons':
                    FieldValue.arrayUnion([widget.lesson?.reference]),
                'completed_levels':
                    FieldValue.arrayUnion([widget.level?.reference]),
              },
            ),
          });
        } else {
          logFirebaseEvent('contentPage_backend_call');

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'completeLessons':
                    FieldValue.arrayUnion([widget.lesson?.reference]),
              },
            ),
          });
        }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 44.0, 24.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('CONTENT_Container_aasixv5i_ON_TAP');
                      logFirebaseEvent('Container_navigate_back');
                      context.safePop();
                    },
                    child: Container(
                      width: 40.0,
                      height: 44.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Icon(
                          FFIcons.kleft2,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        widget.lesson?.title,
                        '0',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final contentBlock = widget.lesson?.content
                              .where((e) =>
                                  e.lang ==
                                  FFLocalizations.of(context).languageCode)
                              .toList()
                              .sortedList(keyOf: (e) => e.order, desc: false)
                              .toList() ??
                          [];

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          46.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: contentBlock.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                        itemBuilder: (context, contentBlockIndex) {
                          final contentBlockItem =
                              contentBlock[contentBlockIndex];
                          return ContentBlockWidget(
                            key: Key(
                                'Keyezo_${contentBlockIndex}_of_${contentBlock.length}'),
                            level: contentBlockItem,
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
      ),
    );
  }
}
