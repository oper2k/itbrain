import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShowAppleRecord extends FirestoreRecord {
  ShowAppleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isShow1" field.
  bool? _isShow1;
  bool get isShow1 => _isShow1 ?? false;
  bool hasIsShow1() => _isShow1 != null;

  void _initializeFields() {
    _isShow1 = snapshotData['isShow1'] as bool?;
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
  bool? isShow1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isShow1': isShow1,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShowAppleRecordDocumentEquality implements Equality<ShowAppleRecord> {
  const ShowAppleRecordDocumentEquality();

  @override
  bool equals(ShowAppleRecord? e1, ShowAppleRecord? e2) {
    return e1?.isShow1 == e2?.isShow1;
  }

  @override
  int hash(ShowAppleRecord? e) => const ListEquality().hash([e?.isShow1]);

  @override
  bool isValidKey(Object? o) => o is ShowAppleRecord;
}
