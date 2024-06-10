import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'confirmed_feedback_model.dart';
export 'confirmed_feedback_model.dart';

class ConfirmedFeedbackWidget extends StatefulWidget {
  const ConfirmedFeedbackWidget({super.key});

  @override
  State<ConfirmedFeedbackWidget> createState() =>
      _ConfirmedFeedbackWidgetState();
}

class _ConfirmedFeedbackWidgetState extends State<ConfirmedFeedbackWidget> {
  late ConfirmedFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmedFeedbackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
    });
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Image.asset(
            'assets/images/check.png',
            width: 64.0,
            height: 64.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'nw3ab5fb' /* Отзыв отправлен */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Evolventa',
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                  lineHeight: 1.16,
                ),
          ),
        ),
      ],
    );
  }
}
