// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:launch_review/launch_review.dart';

Future launchReview(
  String appleID,
  String googleID,
) async {
  LaunchReview.launch(
      androidAppId: googleID, //appid google
      iOSAppId: appleID); // appidapple
}
// Add your function code here!
