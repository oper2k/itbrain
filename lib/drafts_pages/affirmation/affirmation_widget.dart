import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'affirmation_model.dart';
export 'affirmation_model.dart';

class AffirmationWidget extends StatefulWidget {
  const AffirmationWidget({
    super.key,
    required this.currentAffirmation,
  });

  final AffirmationRecord? currentAffirmation;

  @override
  State<AffirmationWidget> createState() => _AffirmationWidgetState();
}

class _AffirmationWidgetState extends State<AffirmationWidget> {
  late AffirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffirmationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().lastDateShowAffirmation = getCurrentTimestamp;
        FFAppState().lastShowAffirmation = widget.currentAffirmation?.reference;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Frame_11818.png',
                ).image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
