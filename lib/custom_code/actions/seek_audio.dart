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
import 'package:assets_audio_player/assets_audio_player.dart';

Future seekAudio(String playerId, int seekPosition) async {
  final _audioPlayer = AssetsAudioPlayer.withId(playerId);
  print([seekPosition, "seek"]);
  if (_audioPlayer.current.hasValue) {
    final _duration = _audioPlayer.current.value!.audio.duration;
    if (seekPosition > _duration.inMilliseconds || seekPosition < 0) {
      await _audioPlayer.seek(Duration(milliseconds: 0));
    } else {
      await _audioPlayer.seek(Duration(milliseconds: seekPosition));
    }
  }
}
