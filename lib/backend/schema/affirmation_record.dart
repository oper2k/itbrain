import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AffirmationRecord extends FirestoreRecord {
  AffirmationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "affirmationTitle" field.
  String? _affirmationTitle;
  String get affirmationTitle => _affirmationTitle ?? '';
  bool hasAffirmationTitle() => _affirmationTitle != null;

  // "affirmationSubTitle" field.
  String? _affirmationSubTitle;
  String get affirmationSubTitle => _affirmationSubTitle ?? '';
  bool hasAffirmationSubTitle() => _affirmationSubTitle != null;

  // "affirmationImage" field.
  String? _affirmationImage;
  String get affirmationImage => _affirmationImage ?? '';
  bool hasAffirmationImage() => _affirmationImage != null;

  // "affirmationTitle_eng" field.
  String? _affirmationTitleEng;
  String get affirmationTitleEng => _affirmationTitleEng ?? '';
  bool hasAffirmationTitleEng() => _affirmationTitleEng != null;

  // "affirmationSubTitleEng" field.
  String? _affirmationSubTitleEng;
  String get affirmationSubTitleEng => _affirmationSubTitleEng ?? '';
  bool hasAffirmationSubTitleEng() => _affirmationSubTitleEng != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _affirmationTitle = snapshotData['affirmationTitle'] as String?;
    _affirmationSubTitle = snapshotData['affirmationSubTitle'] as String?;
    _affirmationImage = snapshotData['affirmationImage'] as String?;
    _affirmationTitleEng = snapshotData['affirmationTitle_eng'] as String?;
    _affirmationSubTitleEng = snapshotData['affirmationSubTitleEng'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('affirmation');

  static Stream<AffirmationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AffirmationRecord.fromSnapshot(s));

  static Future<AffirmationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AffirmationRecord.fromSnapshot(s));

  static AffirmationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AffirmationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AffirmationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AffirmationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AffirmationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AffirmationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAffirmationRecordData({
  String? affirmationTitle,
  String? affirmationSubTitle,
  String? affirmationImage,
  String? affirmationTitleEng,
  String? affirmationSubTitleEng,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'affirmationTitle': affirmationTitle,
      'affirmationSubTitle': affirmationSubTitle,
      'affirmationImage': affirmationImage,
      'affirmationTitle_eng': affirmationTitleEng,
      'affirmationSubTitleEng': affirmationSubTitleEng,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class AffirmationRecordDocumentEquality implements Equality<AffirmationRecord> {
  const AffirmationRecordDocumentEquality();

  @override
  bool equals(AffirmationRecord? e1, AffirmationRecord? e2) {
    return e1?.affirmationTitle == e2?.affirmationTitle &&
        e1?.affirmationSubTitle == e2?.affirmationSubTitle &&
        e1?.affirmationImage == e2?.affirmationImage &&
        e1?.affirmationTitleEng == e2?.affirmationTitleEng &&
        e1?.affirmationSubTitleEng == e2?.affirmationSubTitleEng &&
        e1?.date == e2?.date;
  }

  @override
  int hash(AffirmationRecord? e) => const ListEquality().hash([
        e?.affirmationTitle,
        e?.affirmationSubTitle,
        e?.affirmationImage,
        e?.affirmationTitleEng,
        e?.affirmationSubTitleEng,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is AffirmationRecord;
}
