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

Future<List<MeditationsRecord>> convertLessonToMeditation(
    LessonContentStruct lesson) async {
  // Add your function code here!
  final fakeDocumentReference =
      FirebaseFirestore.instance.collection('meditations').doc();

  MeditationsRecord meditation = MeditationsRecord.getDocumentFromData({
    'title': lesson.audioTitle,
    'duration': lesson.audioDuration,
    'audioPath': lesson.audio,
    'lang': lesson.lang,
    'description': lesson.audioDescription,
  }, fakeDocumentReference);

  return [meditation];
}
