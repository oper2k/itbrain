import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'created_by_model.dart';
export 'created_by_model.dart';

class CreatedByWidget extends StatefulWidget {
  const CreatedByWidget({
    super.key,
    required this.photo,
  });

  final String? photo;

  @override
  State<CreatedByWidget> createState() => _CreatedByWidgetState();
}

class _CreatedByWidgetState extends State<CreatedByWidget> {
  late CreatedByModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatedByModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/Group_10538.webp',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'j9hq13ek' /* С любовью */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'tq7bhxlu' /* Камаллая */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
