import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "content" field.
  List<LessonContentStruct>? _content;
  List<LessonContentStruct> get content => _content ?? const [];
  bool hasContent() => _content != null;

  // "open_date" field.
  DateTime? _openDate;
  DateTime? get openDate => _openDate;
  bool hasOpenDate() => _openDate != null;

  // "titleEng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "level" field.
  DocumentReference? _level;
  DocumentReference? get level => _level;
  bool hasLevel() => _level != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _count = castToType<int>(snapshotData['count']);
    _content = getStructList(
      snapshotData['content'],
      LessonContentStruct.fromMap,
    );
    _openDate = snapshotData['open_date'] as DateTime?;
    _titleEng = snapshotData['titleEng'] as String?;
    _level = snapshotData['level'] as DocumentReference?;
    _course = snapshotData['course'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessons');

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? title,
  int? count,
  DateTime? openDate,
  String? titleEng,
  DocumentReference? level,
  DocumentReference? course,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'count': count,
      'open_date': openDate,
      'titleEng': titleEng,
      'level': level,
      'course': course,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.count == e2?.count &&
        listEquality.equals(e1?.content, e2?.content) &&
        e1?.openDate == e2?.openDate &&
        e1?.titleEng == e2?.titleEng &&
        e1?.level == e2?.level &&
        e1?.course == e2?.course;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.count,
        e?.content,
        e?.openDate,
        e?.titleEng,
        e?.level,
        e?.course
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
