import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'small_video_comp_model.dart';
export 'small_video_comp_model.dart';

class SmallVideoCompWidget extends StatefulWidget {
  const SmallVideoCompWidget({
    super.key,
    required this.video,
  });

  final VideosRecord? video;

  @override
  State<SmallVideoCompWidget> createState() => _SmallVideoCompWidgetState();
}

class _SmallVideoCompWidgetState extends State<SmallVideoCompWidget> {
  late SmallVideoCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallVideoCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 500),
            imageUrl: widget.video!.videoCover,
            width: 160.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getVariableText(
                    ruText: widget.video?.title,
                    enText: widget.video?.titleEng,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Evolventa',
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
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
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
