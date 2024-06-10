// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchasedCourseStruct extends FFFirebaseStruct {
  PurchasedCourseStruct({
    DocumentReference? courseRef,
    DateTime? purchasedDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseRef = courseRef,
        _purchasedDate = purchasedDate,
        super(firestoreUtilData);

  // "course_ref" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  set courseRef(DocumentReference? val) => _courseRef = val;
  bool hasCourseRef() => _courseRef != null;

  // "purchased_date" field.
  DateTime? _purchasedDate;
  DateTime? get purchasedDate => _purchasedDate;
  set purchasedDate(DateTime? val) => _purchasedDate = val;
  bool hasPurchasedDate() => _purchasedDate != null;

  static PurchasedCourseStruct fromMap(Map<String, dynamic> data) =>
      PurchasedCourseStruct(
        courseRef: data['course_ref'] as DocumentReference?,
        purchasedDate: data['purchased_date'] as DateTime?,
      );

  static PurchasedCourseStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchasedCourseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'course_ref': _courseRef,
        'purchased_date': _purchasedDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'course_ref': serializeParam(
          _courseRef,
          ParamType.DocumentReference,
        ),
        'purchased_date': serializeParam(
          _purchasedDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PurchasedCourseStruct fromSerializableMap(Map<String, dynamic> data) =>
      PurchasedCourseStruct(
        courseRef: deserializeParam(
          data['course_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['studyCategories'],
        ),
        purchasedDate: deserializeParam(
          data['purchased_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PurchasedCourseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchasedCourseStruct &&
        courseRef == other.courseRef &&
        purchasedDate == other.purchasedDate;
  }

  @override
  int get hashCode => const ListEquality().hash([courseRef, purchasedDate]);
}

PurchasedCourseStruct createPurchasedCourseStruct({
  DocumentReference? courseRef,
  DateTime? purchasedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchasedCourseStruct(
      courseRef: courseRef,
      purchasedDate: purchasedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchasedCourseStruct? updatePurchasedCourseStruct(
  PurchasedCourseStruct? purchasedCourse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchasedCourse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchasedCourseStructData(
  Map<String, dynamic> firestoreData,
  PurchasedCourseStruct? purchasedCourse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchasedCourse == null) {
    return;
  }
  if (purchasedCourse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchasedCourse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchasedCourseData =
      getPurchasedCourseFirestoreData(purchasedCourse, forFieldValue);
  final nestedData =
      purchasedCourseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = purchasedCourse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchasedCourseFirestoreData(
  PurchasedCourseStruct? purchasedCourse, [
  bool forFieldValue = false,
]) {
  if (purchasedCourse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchasedCourse.toMap());

  // Add any Firestore field values
  purchasedCourse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchasedCourseListFirestoreData(
  List<PurchasedCourseStruct>? purchasedCourses,
) =>
    purchasedCourses
        ?.map((e) => getPurchasedCourseFirestoreData(e, true))
        .toList() ??
    [];
