import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ShowAppleRecord extends FirestoreRecord {
  ShowAppleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isShow2" field.
  bool? _isShow2;
  bool get isShow2 => _isShow2 ?? false;
  bool hasIsShow2() => _isShow2 != null;

  void _initializeFields() {
    _isShow2 = snapshotData['isShow2'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('showApple');

  static Stream<ShowAppleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShowAppleRecord.fromSnapshot(s));

  static Future<ShowAppleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShowAppleRecord.fromSnapshot(s));

  static ShowAppleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShowAppleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShowAppleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShowAppleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShowAppleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShowAppleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShowAppleRecordData({
  bool? isShow2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isShow2': isShow2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShowAppleRecordDocumentEquality implements Equality<ShowAppleRecord> {
  const ShowAppleRecordDocumentEquality();

  @override
  bool equals(ShowAppleRecord? e1, ShowAppleRecord? e2) {
    return e1?.isShow2 == e2?.isShow2;
  }

  @override
  int hash(ShowAppleRecord? e) => const ListEquality().hash([e?.isShow2]);

  @override
  bool isValidKey(Object? o) => o is ShowAppleRecord;
}
