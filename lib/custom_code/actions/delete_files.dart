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
import 'dart:io';

Future<bool> deleteFiles(MeditationAudioStruct? track) async {
  if (track == null) return false;
  try {
    bool audioDeleted = true;
    bool imageDeleted = true;

    if (track.localAudioPath != "") {
      final audioFile = File(track.localAudioPath);
      if (await audioFile.exists()) {
        await audioFile.delete();
        print("Audio file at $track.localAudioPath deleted successfully.");
      } else {
        audioDeleted = false;
        print("Audio file at $track.localAudioPath not found.");
      }
    }

    if (track.localImagePath != null) {
      final imageFile = File(track.localImagePath);
      if (await imageFile.exists()) {
        await imageFile.delete();
        print("Image file at $track.localImagePath deleted successfully.");
      } else {
        imageDeleted = false;
        print("Image file at $track.localImagePath not found.");
      }
    }
    FFAppState().removeFromDownloadedTracks(track);
    return audioDeleted && imageDeleted;
  } catch (e) {
    print("Error deleting files: $e");
    return false;
  }
}
