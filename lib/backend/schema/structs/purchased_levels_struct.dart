// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchasedLevelsStruct extends FFFirebaseStruct {
  PurchasedLevelsStruct({
    DocumentReference? courseRef,
    DateTime? finishedDate,
    DateTime? openedDate,
    String? levelOfferId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseRef = courseRef,
        _finishedDate = finishedDate,
        _openedDate = openedDate,
        _levelOfferId = levelOfferId,
        super(firestoreUtilData);

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  set courseRef(DocumentReference? val) => _courseRef = val;

  bool hasCourseRef() => _courseRef != null;

  // "finished_date" field.
  DateTime? _finishedDate;
  DateTime? get finishedDate => _finishedDate;
  set finishedDate(DateTime? val) => _finishedDate = val;

  bool hasFinishedDate() => _finishedDate != null;

  // "opened_date" field.
  DateTime? _openedDate;
  DateTime? get openedDate => _openedDate;
  set openedDate(DateTime? val) => _openedDate = val;

  bool hasOpenedDate() => _openedDate != null;

  // "levelOfferId" field.
  String? _levelOfferId;
  String get levelOfferId => _levelOfferId ?? '';
  set levelOfferId(String? val) => _levelOfferId = val;

  bool hasLevelOfferId() => _levelOfferId != null;

  static PurchasedLevelsStruct fromMap(Map<String, dynamic> data) =>
      PurchasedLevelsStruct(
        courseRef: data['courseRef'] as DocumentReference?,
        finishedDate: data['finished_date'] as DateTime?,
        openedDate: data['opened_date'] as DateTime?,
        levelOfferId: data['levelOfferId'] as String?,
      );

  static PurchasedLevelsStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchasedLevelsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseRef': _courseRef,
        'finished_date': _finishedDate,
        'opened_date': _openedDate,
        'levelOfferId': _levelOfferId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseRef': serializeParam(
          _courseRef,
          ParamType.DocumentReference,
        ),
        'finished_date': serializeParam(
          _finishedDate,
          ParamType.DateTime,
        ),
        'opened_date': serializeParam(
          _openedDate,
          ParamType.DateTime,
        ),
        'levelOfferId': serializeParam(
          _levelOfferId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PurchasedLevelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PurchasedLevelsStruct(
        courseRef: deserializeParam(
          data['courseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['studyCategories'],
        ),
        finishedDate: deserializeParam(
          data['finished_date'],
          ParamType.DateTime,
          false,
        ),
        openedDate: deserializeParam(
          data['opened_date'],
          ParamType.DateTime,
          false,
        ),
        levelOfferId: deserializeParam(
          data['levelOfferId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PurchasedLevelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchasedLevelsStruct &&
        courseRef == other.courseRef &&
        finishedDate == other.finishedDate &&
        openedDate == other.openedDate &&
        levelOfferId == other.levelOfferId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([courseRef, finishedDate, openedDate, levelOfferId]);
}

PurchasedLevelsStruct createPurchasedLevelsStruct({
  DocumentReference? courseRef,
  DateTime? finishedDate,
  DateTime? openedDate,
  String? levelOfferId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchasedLevelsStruct(
      courseRef: courseRef,
      finishedDate: finishedDate,
      openedDate: openedDate,
      levelOfferId: levelOfferId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchasedLevelsStruct? updatePurchasedLevelsStruct(
  PurchasedLevelsStruct? purchasedLevels, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchasedLevels
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchasedLevelsStructData(
  Map<String, dynamic> firestoreData,
  PurchasedLevelsStruct? purchasedLevels,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchasedLevels == null) {
    return;
  }
  if (purchasedLevels.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchasedLevels.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchasedLevelsData =
      getPurchasedLevelsFirestoreData(purchasedLevels, forFieldValue);
  final nestedData =
      purchasedLevelsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = purchasedLevels.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchasedLevelsFirestoreData(
  PurchasedLevelsStruct? purchasedLevels, [
  bool forFieldValue = false,
]) {
  if (purchasedLevels == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchasedLevels.toMap());

  // Add any Firestore field values
  purchasedLevels.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchasedLevelsListFirestoreData(
  List<PurchasedLevelsStruct>? purchasedLevelss,
) =>
    purchasedLevelss
        ?.map((e) => getPurchasedLevelsFirestoreData(e, true))
        .toList() ??
    [];
