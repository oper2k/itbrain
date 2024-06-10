import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'video_comp_model.dart';
export 'video_comp_model.dart';

class VideoCompWidget extends StatefulWidget {
  const VideoCompWidget({
    super.key,
    required this.video,
  });

  final VideosRecord? video;

  @override
  State<VideoCompWidget> createState() => _VideoCompWidgetState();
}

class _VideoCompWidgetState extends State<VideoCompWidget> {
  late VideoCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 500),
            imageUrl: widget.video!.videoCover,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getVariableText(
                ruText: widget.video?.title,
                enText: widget.video?.titleEng,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Evolventa',
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getVariableText(
                ruText: widget.video?.duration,
                enText: widget.video?.durationEng,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Evolventa',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
