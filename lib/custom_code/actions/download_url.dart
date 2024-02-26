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

Future<bool> downloadUrl(
    String? id, String? soundUrl, String? pictureUrl) async {
  MeditationAudioStruct newTrack =
      MeditationAudioStruct(id: id, audioPath: soundUrl, progress: 0);
  FFAppState().addToDownloadingTracks(newTrack);
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  bool isAudioDownloaded = false;
  final ValueNotifier<double> _progress = ValueNotifier<double>(0.0);

  _progress.addListener(() {
    if (_progress.value == 1) {
      print(_progress);
    }
    FFAppState().update(() {
      newTrack.progress = _progress.value;
    });
  });

  String getFileType(String url) {
    int index = url.indexOf("?");
    if (index == -1 || index < 3) {
      return "";
    } else {
      return url.substring(index - 3, index);
    }
  }

  Future<String?> downloadFile(
      String fileType, String url, String id, String path,
      {bool trackProgress = false}) async {
    try {
      final HttpClient httpClient = HttpClient();
      final File file = File('${path}/${id}.${fileType}');
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();
      final contentLength = response.contentLength ?? 0;

      final completer = Completer<List<int>>();
      final chunks = <int>[];
      int downloaded = 0;

      response.listen((chunk) {
        downloaded += chunk.length;
        if (trackProgress) {
          _progress.value = contentLength != 0 ? downloaded / contentLength : 0;
        }
        chunks.addAll(chunk);
      }, onDone: () {
        completer.complete(chunks);
      });

      final bytes = await completer.future;
      await file.writeAsBytes(Uint8List.fromList(bytes));
      print("File downloaded to ${file.path}");
      return file.path;
    } catch (e) {
      print("Failed to download: $e");
      return null;
    }
  }

  if (soundUrl != null && !kIsWeb) {
    String fileMusicType = getFileType(soundUrl);
    if (id != null) {
      newTrack.localAudioPath = await downloadFile(
          fileMusicType, soundUrl, id, path,
          trackProgress: true);
      isAudioDownloaded = newTrack.localAudioPath != null;
    }
  } else {
    print(
        "Sound URL doesn't exist or doesn't allow downloading files in a web app");
  }

  if (isAudioDownloaded) {
    FFAppState().addToDownloadedTracks(newTrack);
  }
  FFAppState().removeFromDownloadingTracks(newTrack);
  return isAudioDownloaded;
}
