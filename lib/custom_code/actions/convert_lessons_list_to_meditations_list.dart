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

Future<List<MeditationsRecord>> convertLessonsListToMeditationsList(
    List<LessonsRecord> lessonsList) async {
  // Add your function code here!

  return lessonsList.map((lesson) {
    // Создаём фейковый DocumentReference 🦖
    final fakeDocumentReference =
        FirebaseFirestore.instance.collection('meditations').doc();

    // Создаём объект MeditationsRecord из данных урока
    return MeditationsRecord.getDocumentFromData({
      'title': lesson.audioTitle,
      'duration': lesson.audioDuration,
      'audioPath': lesson.mainAudio,
      'lang': lesson.lang,
      'description': lesson.audioDescription,
    }, fakeDocumentReference);
  }).toList();
}
