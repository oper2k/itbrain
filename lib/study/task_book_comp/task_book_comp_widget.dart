import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/book_content/book_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'task_book_comp_model.dart';
export 'task_book_comp_model.dart';

class TaskBookCompWidget extends StatefulWidget {
  const TaskBookCompWidget({
    super.key,
    required this.title,
    required this.description,
    bool? htmlView,
  }) : htmlView = htmlView ?? false;

  final String? title;
  final String? description;
  final bool htmlView;

  @override
  State<TaskBookCompWidget> createState() => _TaskBookCompWidgetState();
}

class _TaskBookCompWidgetState extends State<TaskBookCompWidget> {
  late TaskBookCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskBookCompModel());
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
      height: 272.0,
      decoration: BoxDecoration(
        color: const Color(0xFFE8C697),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      color: const Color(0xFF2F0A4C),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.htmlView) {
                            return Html(
                              data: valueOrDefault<String>(
                                '<style> li {color: #2F0A4C;} li span {color: #2F0A4C;}  p {color: #2F0A4C;} body {color: #2F0A4C;} </style> <body>${widget.description}</body>',
                                '0',
                              ),
                              onLinkTap: (url, _, __) => launchURL(url!),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: MarkdownBody(
                                data: widget.description!,
                                selectable: true,
                                onTapLink: (_, url, __) => launchURL(url!),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TASK_BOOK_COMP_COMP_Row_wn3riq9q_ON_TAP');
                  logFirebaseEvent('Row_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: BookContentWidget(
                          content: LessonContentStruct(
                            bookText: widget.description,
                            bookTitle: widget.title,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'xqiyd1e9' /* Еще */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              color: const Color(0xFF541882),
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFF541882),
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
