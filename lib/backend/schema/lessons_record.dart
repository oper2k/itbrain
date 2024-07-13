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

  // "mainAudio" field.
  String? _mainAudio;
  String get mainAudio => _mainAudio ?? '';
  bool hasMainAudio() => _mainAudio != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "audioTitle" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  bool hasAudioTitle() => _audioTitle != null;

  // "audioDuration" field.
  String? _audioDuration;
  String get audioDuration => _audioDuration ?? '';
  bool hasAudioDuration() => _audioDuration != null;

  // "audioDescription" field.
  String? _audioDescription;
  String get audioDescription => _audioDescription ?? '';
  bool hasAudioDescription() => _audioDescription != null;

  // "open_date" field.
  DateTime? _openDate;
  DateTime? get openDate => _openDate;
  bool hasOpenDate() => _openDate != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _count = castToType<int>(snapshotData['count']);
    _content = getStructList(
      snapshotData['content'],
      LessonContentStruct.fromMap,
    );
    _titleEng = snapshotData['titleEng'] as String?;
    _level = snapshotData['level'] as DocumentReference?;
    _course = snapshotData['course'] as DocumentReference?;
    _mainAudio = snapshotData['mainAudio'] as String?;
    _lang = snapshotData['lang'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _audioTitle = snapshotData['audioTitle'] as String?;
    _audioDuration = snapshotData['audioDuration'] as String?;
    _audioDescription = snapshotData['audioDescription'] as String?;
    _openDate = snapshotData['open_date'] as DateTime?;
    _image = snapshotData['image'] as String?;
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
  String? titleEng,
  DocumentReference? level,
  DocumentReference? course,
  String? mainAudio,
  String? lang,
  int? order,
  String? audioTitle,
  String? audioDuration,
  String? audioDescription,
  DateTime? openDate,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'count': count,
      'titleEng': titleEng,
      'level': level,
      'course': course,
      'mainAudio': mainAudio,
      'lang': lang,
      'order': order,
      'audioTitle': audioTitle,
      'audioDuration': audioDuration,
      'audioDescription': audioDescription,
      'open_date': openDate,
      'image': image,
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
        e1?.titleEng == e2?.titleEng &&
        e1?.level == e2?.level &&
        e1?.course == e2?.course &&
        e1?.mainAudio == e2?.mainAudio &&
        e1?.lang == e2?.lang &&
        e1?.order == e2?.order &&
        e1?.audioTitle == e2?.audioTitle &&
        e1?.audioDuration == e2?.audioDuration &&
        e1?.audioDescription == e2?.audioDescription &&
        e1?.openDate == e2?.openDate &&
        e1?.image == e2?.image;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.count,
        e?.content,
        e?.titleEng,
        e?.level,
        e?.course,
        e?.mainAudio,
        e?.lang,
        e?.order,
        e?.audioTitle,
        e?.audioDuration,
        e?.audioDescription,
        e?.openDate,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
