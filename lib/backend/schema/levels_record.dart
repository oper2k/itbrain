import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LevelsRecord extends FirestoreRecord {
  LevelsRecord._(
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
  String? _count;
  String get count => _count ?? '';
  bool hasCount() => _count != null;

  // "course_ref" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "bonus" field.
  bool? _bonus;
  bool get bonus => _bonus ?? false;
  bool hasBonus() => _bonus != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "getCourse_offer" field.
  String? _getCourseOffer;
  String get getCourseOffer => _getCourseOffer ?? '';
  bool hasGetCourseOffer() => _getCourseOffer != null;

  // "getCourse_url" field.
  String? _getCourseUrl;
  String get getCourseUrl => _getCourseUrl ?? '';
  bool hasGetCourseUrl() => _getCourseUrl != null;

  // "titleEng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "descrEng" field.
  String? _descrEng;
  String get descrEng => _descrEng ?? '';
  bool hasDescrEng() => _descrEng != null;

  // "getCourse_urlEng" field.
  String? _getCourseUrlEng;
  String get getCourseUrlEng => _getCourseUrlEng ?? '';
  bool hasGetCourseUrlEng() => _getCourseUrlEng != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _count = snapshotData['count'] as String?;
    _courseRef = snapshotData['course_ref'] as DocumentReference?;
    _bonus = snapshotData['bonus'] as bool?;
    _description = snapshotData['description'] as String?;
    _getCourseOffer = snapshotData['getCourse_offer'] as String?;
    _getCourseUrl = snapshotData['getCourse_url'] as String?;
    _titleEng = snapshotData['titleEng'] as String?;
    _descrEng = snapshotData['descrEng'] as String?;
    _getCourseUrlEng = snapshotData['getCourse_urlEng'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('levels');

  static Stream<LevelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LevelsRecord.fromSnapshot(s));

  static Future<LevelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LevelsRecord.fromSnapshot(s));

  static LevelsRecord fromSnapshot(DocumentSnapshot snapshot) => LevelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LevelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LevelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LevelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LevelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLevelsRecordData({
  String? title,
  String? count,
  DocumentReference? courseRef,
  bool? bonus,
  String? description,
  String? getCourseOffer,
  String? getCourseUrl,
  String? titleEng,
  String? descrEng,
  String? getCourseUrlEng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'count': count,
      'course_ref': courseRef,
      'bonus': bonus,
      'description': description,
      'getCourse_offer': getCourseOffer,
      'getCourse_url': getCourseUrl,
      'titleEng': titleEng,
      'descrEng': descrEng,
      'getCourse_urlEng': getCourseUrlEng,
    }.withoutNulls,
  );

  return firestoreData;
}

class LevelsRecordDocumentEquality implements Equality<LevelsRecord> {
  const LevelsRecordDocumentEquality();

  @override
  bool equals(LevelsRecord? e1, LevelsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.count == e2?.count &&
        e1?.courseRef == e2?.courseRef &&
        e1?.bonus == e2?.bonus &&
        e1?.description == e2?.description &&
        e1?.getCourseOffer == e2?.getCourseOffer &&
        e1?.getCourseUrl == e2?.getCourseUrl &&
        e1?.titleEng == e2?.titleEng &&
        e1?.descrEng == e2?.descrEng &&
        e1?.getCourseUrlEng == e2?.getCourseUrlEng;
  }

  @override
  int hash(LevelsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.count,
        e?.courseRef,
        e?.bonus,
        e?.description,
        e?.getCourseOffer,
        e?.getCourseUrl,
        e?.titleEng,
        e?.descrEng,
        e?.getCourseUrlEng
      ]);

  @override
  bool isValidKey(Object? o) => o is LevelsRecord;
}
