// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart'; // Imports custom actions

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:provider/provider.dart';
import 'package:progress_border/progress_border.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({Key? key, this.width, this.height, this.track})
      : super(key: key);

  final double? width;
  final double? height;
  final MeditationAudioStruct? track;
  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: ProgressBorder.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
          progress: widget.track!.progress,
        ),
      ),
    );
  }
}
