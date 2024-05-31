import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/created_by/created_by_widget.dart';
import '/study/divider/divider_widget.dart';
import '/study/study_audio/study_audio_widget.dart';
import '/study/study_image/study_image_widget.dart';
import '/study/task_book_comp/task_book_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'content_block_model.dart';
export 'content_block_model.dart';

class ContentBlockWidget extends StatefulWidget {
  const ContentBlockWidget({
    super.key,
    required this.level,
  });

  final LessonContentStruct? level;

  @override
  State<ContentBlockWidget> createState() => _ContentBlockWidgetState();
}

class _ContentBlockWidgetState extends State<ContentBlockWidget>
    with TickerProviderStateMixin {
  late ContentBlockModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentBlockModel());

    animationsMap.addAll({
      'markdownOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            color: Colors.white,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.level?.type == ContentType.image) {
          return wrapWithModel(
            model: _model.studyImageModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: StudyImageWidget(
              image: widget.level!.photo,
            ),
          );
        } else if (widget.level?.type == ContentType.audio) {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.meditations = await actions.convertLessonToMeditation(
                widget.level!,
              );
              FFAppState().playerIndex = 0;
              setState(() {});

              context.pushNamed(
                'playerPage',
                queryParameters: {
                  'audio': serializeParam(
                    _model.meditations,
                    ParamType.Document,
                    true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'audio': _model.meditations,
                },
              );

              setState(() {});
            },
            child: wrapWithModel(
              model: _model.studyAudioModel,
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: StudyAudioWidget(
                title: widget.level!.audioTitle,
                duration: widget.level!.audioDuration,
              ),
            ),
          );
        } else if (widget.level?.type == ContentType.button) {
          return Container(
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
                begin: AlignmentDirectional(1.0, 0.34),
                end: AlignmentDirectional(-1.0, -0.34),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'oxsl9hph' /* Посмотреть ответы (коды) */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          );
        } else if (widget.level?.type == ContentType.text) {
          return MarkdownBody(
            data: widget.level!.text,
            selectable: false,
            onTapLink: (_, url, __) => launchURL(url!),
          ).animateOnPageLoad(animationsMap['markdownOnPageLoadAnimation']!);
        } else if (widget.level?.type == ContentType.createdBy) {
          return wrapWithModel(
            model: _model.createdByModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: CreatedByWidget(
              photo: widget.level!.createdByPhoto,
            ),
          );
        } else if (widget.level?.type == ContentType.title) {
          return Text(
            valueOrDefault<String>(
              widget.level?.title,
              '0',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Evolventa',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          );
        } else if (widget.level?.type == ContentType.autorBlock) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  widget.level!.textAutorPhoto,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(
                  valueOrDefault<String>(
                    widget.level?.textAutorName,
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Evolventa',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ].divide(const SizedBox(width: 12.0)),
          );
        } else if (widget.level?.type == ContentType.book) {
          return wrapWithModel(
            model: _model.taskBookCompModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: TaskBookCompWidget(
              title: widget.level!.bookTitle,
              description: widget.level!.bookText,
            ),
          );
        } else if (widget.level?.showDivider ?? false) {
          return wrapWithModel(
            model: _model.dividerModel,
            updateCallback: () => setState(() {}),
            child: const DividerWidget(),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          );
        }
      },
    );
  }
}
