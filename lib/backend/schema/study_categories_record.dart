import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StudyCategoriesRecord extends FirestoreRecord {
  StudyCategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "soon" field.
  bool? _soon;
  bool get soon => _soon ?? false;
  bool hasSoon() => _soon != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "titleEng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "descrEng" field.
  String? _descrEng;
  String get descrEng => _descrEng ?? '';
  bool hasDescrEng() => _descrEng != null;

  // "coverEng" field.
  String? _coverEng;
  String get coverEng => _coverEng ?? '';
  bool hasCoverEng() => _coverEng != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "durationEng" field.
  String? _durationEng;
  String get durationEng => _durationEng ?? '';
  bool hasDurationEng() => _durationEng != null;

  // "course_url" field.
  String? _courseUrl;
  String get courseUrl => _courseUrl ?? '';
  bool hasCourseUrl() => _courseUrl != null;

  // "course_eng_url" field.
  String? _courseEngUrl;
  String get courseEngUrl => _courseEngUrl ?? '';
  bool hasCourseEngUrl() => _courseEngUrl != null;

  // "course_info_image" field.
  String? _courseInfoImage;
  String get courseInfoImage => _courseInfoImage ?? '';
  bool hasCourseInfoImage() => _courseInfoImage != null;

  // "course_text" field.
  String? _courseText;
  String get courseText => _courseText ?? '';
  bool hasCourseText() => _courseText != null;

  // "course_text_eng" field.
  String? _courseTextEng;
  String get courseTextEng => _courseTextEng ?? '';
  bool hasCourseTextEng() => _courseTextEng != null;

  // "showNotificationButton" field.
  bool? _showNotificationButton;
  bool get showNotificationButton => _showNotificationButton ?? false;
  bool hasShowNotificationButton() => _showNotificationButton != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _soon = snapshotData['soon'] as bool?;
    _cover = snapshotData['cover'] as String?;
    _titleEng = snapshotData['titleEng'] as String?;
    _descrEng = snapshotData['descrEng'] as String?;
    _coverEng = snapshotData['coverEng'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _duration = snapshotData['duration'] as String?;
    _durationEng = snapshotData['durationEng'] as String?;
    _courseUrl = snapshotData['course_url'] as String?;
    _courseEngUrl = snapshotData['course_eng_url'] as String?;
    _courseInfoImage = snapshotData['course_info_image'] as String?;
    _courseText = snapshotData['course_text'] as String?;
    _courseTextEng = snapshotData['course_text_eng'] as String?;
    _showNotificationButton = snapshotData['showNotificationButton'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studyCategories');

  static Stream<StudyCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyCategoriesRecord.fromSnapshot(s));

  static Future<StudyCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyCategoriesRecord.fromSnapshot(s));

  static StudyCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyCategoriesRecordData({
  String? title,
  String? description,
  bool? soon,
  String? cover,
  String? titleEng,
  String? descrEng,
  String? coverEng,
  DateTime? startDate,
  String? duration,
  String? durationEng,
  String? courseUrl,
  String? courseEngUrl,
  String? courseInfoImage,
  String? courseText,
  String? courseTextEng,
  bool? showNotificationButton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'soon': soon,
      'cover': cover,
      'titleEng': titleEng,
      'descrEng': descrEng,
      'coverEng': coverEng,
      'start_date': startDate,
      'duration': duration,
      'durationEng': durationEng,
      'course_url': courseUrl,
      'course_eng_url': courseEngUrl,
      'course_info_image': courseInfoImage,
      'course_text': courseText,
      'course_text_eng': courseTextEng,
      'showNotificationButton': showNotificationButton,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyCategoriesRecordDocumentEquality
    implements Equality<StudyCategoriesRecord> {
  const StudyCategoriesRecordDocumentEquality();

  @override
  bool equals(StudyCategoriesRecord? e1, StudyCategoriesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.soon == e2?.soon &&
        e1?.cover == e2?.cover &&
        e1?.titleEng == e2?.titleEng &&
        e1?.descrEng == e2?.descrEng &&
        e1?.coverEng == e2?.coverEng &&
        e1?.startDate == e2?.startDate &&
        e1?.duration == e2?.duration &&
        e1?.durationEng == e2?.durationEng &&
        e1?.courseUrl == e2?.courseUrl &&
        e1?.courseEngUrl == e2?.courseEngUrl &&
        e1?.courseInfoImage == e2?.courseInfoImage &&
        e1?.courseText == e2?.courseText &&
        e1?.courseTextEng == e2?.courseTextEng &&
        e1?.showNotificationButton == e2?.showNotificationButton;
  }

  @override
  int hash(StudyCategoriesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.soon,
        e?.cover,
        e?.titleEng,
        e?.descrEng,
        e?.coverEng,
        e?.startDate,
        e?.duration,
        e?.durationEng,
        e?.courseUrl,
        e?.courseEngUrl,
        e?.courseInfoImage,
        e?.courseText,
        e?.courseTextEng,
        e?.showNotificationButton
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyCategoriesRecord;
}
