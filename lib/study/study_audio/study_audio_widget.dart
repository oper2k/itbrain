import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'study_audio_model.dart';
export 'study_audio_model.dart';

class StudyAudioWidget extends StatefulWidget {
  const StudyAudioWidget({
    super.key,
    required this.title,
    required this.duration,
  });

  final String? title;
  final String? duration;

  @override
  State<StudyAudioWidget> createState() => _StudyAudioWidgetState();
}

class _StudyAudioWidgetState extends State<StudyAudioWidget> {
  late StudyAudioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyAudioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.play,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.title,
                      '0',
                    ).maybeHandleOverflow(
                      maxChars: 20,
                      replacement: '…',
                    ),
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                          lineHeight: 1.29,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.duration,
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.2,
                        ),
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
