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

import 'package:assets_audio_player/assets_audio_player.dart';

Future<int?> getSeekAudioPosition() async {
  final assetsAudioPlayer = AssetsAudioPlayer();

  // Воспроизводим трек, если он ещё не воспроизводится
  if (assetsAudioPlayer.isPlaying.value == true) {
    // Получаем текущую позицию воспроизведения и преобразуем позицию в миллисекунды
    final currentPositionMilliseconds =
        assetsAudioPlayer.currentPosition.value.inMilliseconds;

    return currentPositionMilliseconds;
  } else {
    return null;
  }
}
