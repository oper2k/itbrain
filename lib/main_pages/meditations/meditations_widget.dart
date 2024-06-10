import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'meditations_model.dart';
export 'meditations_model.dart';

class MeditationsWidget extends StatefulWidget {
  const MeditationsWidget({
    super.key,
    required this.meditation,
  });

  final MeditationsRecord? meditation;

  @override
  State<MeditationsWidget> createState() => _MeditationsWidgetState();
}

class _MeditationsWidgetState extends State<MeditationsWidget> {
  late MeditationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if ((widget.meditation?.isPaid == false) ||
                    (currentUserDocument?.purchasedMeditationsPacks.toList() ??
                            [])
                        .contains(widget.meditation?.meditationCategory)) {
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
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 20.0,
                        ),
                      ),
                    ),
                  );
                } else {
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
                          color: FlutterFlowTheme.of(context).primaryText,
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
                  ruText: widget.meditation?.title,
                  enText: widget.meditation?.titleEng,
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
                  ruText: widget.meditation?.duration,
                  enText: widget.meditation?.durationEng,
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
