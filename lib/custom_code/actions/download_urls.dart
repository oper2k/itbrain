// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> downloadUrls(
    List<String> ids, List<String> soundUrls, List<String> pictureUrls) async {
  List<Future<bool>> downloadFutures = [];

  for (int i = 0; i < ids.length; i++) {
    downloadFutures.add(downloadUrl(ids[i], soundUrls[i], pictureUrls[i]));
  }

  List<bool> downloadResults = await Future.wait(downloadFutures);
  bool isSuccessDownload = downloadResults.every((result) => result == true);
  return isSuccessDownload;
}
