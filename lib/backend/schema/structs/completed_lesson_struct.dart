// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletedLessonStruct extends FFFirebaseStruct {
  CompletedLessonStruct({
    DocumentReference? courseRef,
    int? levelIndex,
    int? lessonIndex,
    DateTime? finishedDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseRef = courseRef,
        _levelIndex = levelIndex,
        _lessonIndex = lessonIndex,
        _finishedDate = finishedDate,
        super(firestoreUtilData);

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  set courseRef(DocumentReference? val) => _courseRef = val;

  bool hasCourseRef() => _courseRef != null;

  // "level_Index" field.
  int? _levelIndex;
  int get levelIndex => _levelIndex ?? 0;
  set levelIndex(int? val) => _levelIndex = val;

  void incrementLevelIndex(int amount) => levelIndex = levelIndex + amount;

  bool hasLevelIndex() => _levelIndex != null;

  // "lesson_index" field.
  int? _lessonIndex;
  int get lessonIndex => _lessonIndex ?? 0;
  set lessonIndex(int? val) => _lessonIndex = val;

  void incrementLessonIndex(int amount) => lessonIndex = lessonIndex + amount;

  bool hasLessonIndex() => _lessonIndex != null;

  // "finished_date" field.
  DateTime? _finishedDate;
  DateTime? get finishedDate => _finishedDate;
  set finishedDate(DateTime? val) => _finishedDate = val;

  bool hasFinishedDate() => _finishedDate != null;

  static CompletedLessonStruct fromMap(Map<String, dynamic> data) =>
      CompletedLessonStruct(
        courseRef: data['courseRef'] as DocumentReference?,
        levelIndex: castToType<int>(data['level_Index']),
        lessonIndex: castToType<int>(data['lesson_index']),
        finishedDate: data['finished_date'] as DateTime?,
      );

  static CompletedLessonStruct? maybeFromMap(dynamic data) => data is Map
      ? CompletedLessonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseRef': _courseRef,
        'level_Index': _levelIndex,
        'lesson_index': _lessonIndex,
        'finished_date': _finishedDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseRef': serializeParam(
          _courseRef,
          ParamType.DocumentReference,
        ),
        'level_Index': serializeParam(
          _levelIndex,
          ParamType.int,
        ),
        'lesson_index': serializeParam(
          _lessonIndex,
          ParamType.int,
        ),
        'finished_date': serializeParam(
          _finishedDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CompletedLessonStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompletedLessonStruct(
        courseRef: deserializeParam(
          data['courseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['studyCategories'],
        ),
        levelIndex: deserializeParam(
          data['level_Index'],
          ParamType.int,
          false,
        ),
        lessonIndex: deserializeParam(
          data['lesson_index'],
          ParamType.int,
          false,
        ),
        finishedDate: deserializeParam(
          data['finished_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CompletedLessonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompletedLessonStruct &&
        courseRef == other.courseRef &&
        levelIndex == other.levelIndex &&
        lessonIndex == other.lessonIndex &&
        finishedDate == other.finishedDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([courseRef, levelIndex, lessonIndex, finishedDate]);
}

CompletedLessonStruct createCompletedLessonStruct({
  DocumentReference? courseRef,
  int? levelIndex,
  int? lessonIndex,
  DateTime? finishedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompletedLessonStruct(
      courseRef: courseRef,
      levelIndex: levelIndex,
      lessonIndex: lessonIndex,
      finishedDate: finishedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompletedLessonStruct? updateCompletedLessonStruct(
  CompletedLessonStruct? completedLesson, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    completedLesson
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompletedLessonStructData(
  Map<String, dynamic> firestoreData,
  CompletedLessonStruct? completedLesson,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (completedLesson == null) {
    return;
  }
  if (completedLesson.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && completedLesson.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final completedLessonData =
      getCompletedLessonFirestoreData(completedLesson, forFieldValue);
  final nestedData =
      completedLessonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = completedLesson.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompletedLessonFirestoreData(
  CompletedLessonStruct? completedLesson, [
  bool forFieldValue = false,
]) {
  if (completedLesson == null) {
    return {};
  }
  final firestoreData = mapToFirestore(completedLesson.toMap());

  // Add any Firestore field values
  completedLesson.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompletedLessonListFirestoreData(
  List<CompletedLessonStruct>? completedLessons,
) =>
    completedLessons
        ?.map((e) => getCompletedLessonFirestoreData(e, true))
        .toList() ??
    [];
