import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/study/content_block/content_block_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'content_page_model.dart';
export 'content_page_model.dart';

class ContentPageWidget extends StatefulWidget {
  const ContentPageWidget({
    super.key,
    required this.lesson,
    bool? isLastLesson,
    required this.level,
  }) : this.isLastLesson = isLastLesson ?? false;

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      if (!(currentUserDocument?.completeLessons?.toList() ?? [])
          .contains(widget.lesson?.reference)) {
        if (widget.isLastLesson) {
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
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 44.0, 24.0, 0.0),
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
                      context.safePop();
                    },
                    child: Container(
                      width: 40.0,
                      height: 44.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
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
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final contentBlock = widget.lesson?.content
                              ?.where((e) =>
                                  e.lang ==
                                  FFLocalizations.of(context).languageCode)
                              .toList()
                              ?.sortedList((e) => e.order)
                              ?.toList() ??
                          [];
                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          46.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: contentBlock.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
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
