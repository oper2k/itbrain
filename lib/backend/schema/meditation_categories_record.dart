import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationCategoriesRecord extends FirestoreRecord {
  MeditationCategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nameCategory" field.
  String? _nameCategory;
  String get nameCategory => _nameCategory ?? '';
  bool hasNameCategory() => _nameCategory != null;

  // "descriptionCategory" field.
  String? _descriptionCategory;
  String get descriptionCategory => _descriptionCategory ?? '';
  bool hasDescriptionCategory() => _descriptionCategory != null;

  // "coastOfPack" field.
  int? _coastOfPack;
  int get coastOfPack => _coastOfPack ?? 0;
  bool hasCoastOfPack() => _coastOfPack != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "cetegoryCover" field.
  String? _cetegoryCover;
  String get cetegoryCover => _cetegoryCover ?? '';
  bool hasCetegoryCover() => _cetegoryCover != null;

  // "categoryPhoto" field.
  String? _categoryPhoto;
  String get categoryPhoto => _categoryPhoto ?? '';
  bool hasCategoryPhoto() => _categoryPhoto != null;

  // "getCourseUrl" field.
  String? _getCourseUrl;
  String get getCourseUrl => _getCourseUrl ?? '';
  bool hasGetCourseUrl() => _getCourseUrl != null;

  // "getCourseUrlEng" field.
  String? _getCourseUrlEng;
  String get getCourseUrlEng => _getCourseUrlEng ?? '';
  bool hasGetCourseUrlEng() => _getCourseUrlEng != null;

  // "revenueCat_Id" field.
  String? _revenueCatId;
  String get revenueCatId => _revenueCatId ?? '';
  bool hasRevenueCatId() => _revenueCatId != null;

  // "getcourse_offer" field.
  String? _getcourseOffer;
  String get getcourseOffer => _getcourseOffer ?? '';
  bool hasGetcourseOffer() => _getcourseOffer != null;

  // "nameCategory_eng" field.
  String? _nameCategoryEng;
  String get nameCategoryEng => _nameCategoryEng ?? '';
  bool hasNameCategoryEng() => _nameCategoryEng != null;

  // "descriptionCategory_eng" field.
  String? _descriptionCategoryEng;
  String get descriptionCategoryEng => _descriptionCategoryEng ?? '';
  bool hasDescriptionCategoryEng() => _descriptionCategoryEng != null;

  // "coastOfPack_eng" field.
  String? _coastOfPackEng;
  String get coastOfPackEng => _coastOfPackEng ?? '';
  bool hasCoastOfPackEng() => _coastOfPackEng != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "soon" field.
  bool? _soon;
  bool get soon => _soon ?? false;
  bool hasSoon() => _soon != null;

  // "free" field.
  bool? _free;
  bool get free => _free ?? false;
  bool hasFree() => _free != null;

  // "showAudioCount" field.
  bool? _showAudioCount;
  bool get showAudioCount => _showAudioCount ?? false;
  bool hasShowAudioCount() => _showAudioCount != null;

  void _initializeFields() {
    _nameCategory = snapshotData['nameCategory'] as String?;
    _descriptionCategory = snapshotData['descriptionCategory'] as String?;
    _coastOfPack = castToType<int>(snapshotData['coastOfPack']);
    _isPaid = snapshotData['isPaid'] as bool?;
    _cetegoryCover = snapshotData['cetegoryCover'] as String?;
    _categoryPhoto = snapshotData['categoryPhoto'] as String?;
    _getCourseUrl = snapshotData['getCourseUrl'] as String?;
    _getCourseUrlEng = snapshotData['getCourseUrlEng'] as String?;
    _revenueCatId = snapshotData['revenueCat_Id'] as String?;
    _getcourseOffer = snapshotData['getcourse_offer'] as String?;
    _nameCategoryEng = snapshotData['nameCategory_eng'] as String?;
    _descriptionCategoryEng =
        snapshotData['descriptionCategory_eng'] as String?;
    _coastOfPackEng = snapshotData['coastOfPack_eng'] as String?;
    _count = castToType<int>(snapshotData['count']);
    _sort = castToType<int>(snapshotData['sort']);
    _soon = snapshotData['soon'] as bool?;
    _free = snapshotData['free'] as bool?;
    _showAudioCount = snapshotData['showAudioCount'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditationCategories');

  static Stream<MeditationCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationCategoriesRecord.fromSnapshot(s));

  static Future<MeditationCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MeditationCategoriesRecord.fromSnapshot(s));

  static MeditationCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationCategoriesRecordData({
  String? nameCategory,
  String? descriptionCategory,
  int? coastOfPack,
  bool? isPaid,
  String? cetegoryCover,
  String? categoryPhoto,
  String? getCourseUrl,
  String? getCourseUrlEng,
  String? revenueCatId,
  String? getcourseOffer,
  String? nameCategoryEng,
  String? descriptionCategoryEng,
  String? coastOfPackEng,
  int? count,
  int? sort,
  bool? soon,
  bool? free,
  bool? showAudioCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameCategory': nameCategory,
      'descriptionCategory': descriptionCategory,
      'coastOfPack': coastOfPack,
      'isPaid': isPaid,
      'cetegoryCover': cetegoryCover,
      'categoryPhoto': categoryPhoto,
      'getCourseUrl': getCourseUrl,
      'getCourseUrlEng': getCourseUrlEng,
      'revenueCat_Id': revenueCatId,
      'getcourse_offer': getcourseOffer,
      'nameCategory_eng': nameCategoryEng,
      'descriptionCategory_eng': descriptionCategoryEng,
      'coastOfPack_eng': coastOfPackEng,
      'count': count,
      'sort': sort,
      'soon': soon,
      'free': free,
      'showAudioCount': showAudioCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationCategoriesRecordDocumentEquality
    implements Equality<MeditationCategoriesRecord> {
  const MeditationCategoriesRecordDocumentEquality();

  @override
  bool equals(MeditationCategoriesRecord? e1, MeditationCategoriesRecord? e2) {
    return e1?.nameCategory == e2?.nameCategory &&
        e1?.descriptionCategory == e2?.descriptionCategory &&
        e1?.coastOfPack == e2?.coastOfPack &&
        e1?.isPaid == e2?.isPaid &&
        e1?.cetegoryCover == e2?.cetegoryCover &&
        e1?.categoryPhoto == e2?.categoryPhoto &&
        e1?.getCourseUrl == e2?.getCourseUrl &&
        e1?.getCourseUrlEng == e2?.getCourseUrlEng &&
        e1?.revenueCatId == e2?.revenueCatId &&
        e1?.getcourseOffer == e2?.getcourseOffer &&
        e1?.nameCategoryEng == e2?.nameCategoryEng &&
        e1?.descriptionCategoryEng == e2?.descriptionCategoryEng &&
        e1?.coastOfPackEng == e2?.coastOfPackEng &&
        e1?.count == e2?.count &&
        e1?.sort == e2?.sort &&
        e1?.soon == e2?.soon &&
        e1?.free == e2?.free &&
        e1?.showAudioCount == e2?.showAudioCount;
  }

  @override
  int hash(MeditationCategoriesRecord? e) => const ListEquality().hash([
        e?.nameCategory,
        e?.descriptionCategory,
        e?.coastOfPack,
        e?.isPaid,
        e?.cetegoryCover,
        e?.categoryPhoto,
        e?.getCourseUrl,
        e?.getCourseUrlEng,
        e?.revenueCatId,
        e?.getcourseOffer,
        e?.nameCategoryEng,
        e?.descriptionCategoryEng,
        e?.coastOfPackEng,
        e?.count,
        e?.sort,
        e?.soon,
        e?.free,
        e?.showAudioCount
      ]);

  @override
  bool isValidKey(Object? o) => o is MeditationCategoriesRecord;
}
