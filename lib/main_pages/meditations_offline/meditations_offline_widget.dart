import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'meditations_offline_model.dart';
export 'meditations_offline_model.dart';

class MeditationsOfflineWidget extends StatefulWidget {
  const MeditationsOfflineWidget({
    super.key,
    required this.indexInList,
  });

  final int? indexInList;

  @override
  State<MeditationsOfflineWidget> createState() =>
      _MeditationsOfflineWidgetState();
}

class _MeditationsOfflineWidgetState extends State<MeditationsOfflineWidget> {
  late MeditationsOfflineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationsOfflineModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if (FFAppState()
                        .downloadedTracks[widget.indexInList!]
                        .isPaid ==
                    false) {
                  return Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.play,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
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
                          color: FlutterFlowTheme.of(context).accent1,
                          size: 20.0,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getVariableText(
                  ruText:
                      FFAppState().downloadedTracks[widget.indexInList!].name,
                  enText: FFAppState()
                      .downloadedTracks[widget.indexInList!]
                      .nameEng,
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
                FFLocalizations.of(context).getVariableText(
                  ruText: FFAppState()
                      .downloadedTracks[widget.indexInList!]
                      .duration,
                  enText: FFAppState()
                      .downloadedTracks[widget.indexInList!]
                      .durationEng,
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
    );
  }
}
