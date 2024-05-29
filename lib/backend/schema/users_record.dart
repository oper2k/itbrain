import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "meditationsWishList" field.
  List<DocumentReference>? _meditationsWishList;
  List<DocumentReference> get meditationsWishList =>
      _meditationsWishList ?? const [];
  bool hasMeditationsWishList() => _meditationsWishList != null;

  // "viewedStories" field.
  List<DocumentReference>? _viewedStories;
  List<DocumentReference> get viewedStories => _viewedStories ?? const [];
  bool hasViewedStories() => _viewedStories != null;

  // "dailyAffirmation" field.
  DocumentReference? _dailyAffirmation;
  DocumentReference? get dailyAffirmation => _dailyAffirmation;
  bool hasDailyAffirmation() => _dailyAffirmation != null;

  // "listenedMeditations" field.
  List<DocumentReference>? _listenedMeditations;
  List<DocumentReference> get listenedMeditations =>
      _listenedMeditations ?? const [];
  bool hasListenedMeditations() => _listenedMeditations != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "searchHistory" field.
  List<DocumentReference>? _searchHistory;
  List<DocumentReference> get searchHistory => _searchHistory ?? const [];
  bool hasSearchHistory() => _searchHistory != null;

  // "purchasedMeditationsPacks" field.
  List<DocumentReference>? _purchasedMeditationsPacks;
  List<DocumentReference> get purchasedMeditationsPacks =>
      _purchasedMeditationsPacks ?? const [];
  bool hasPurchasedMeditationsPacks() => _purchasedMeditationsPacks != null;

  // "purchasedStudyPacks" field.
  List<DocumentReference>? _purchasedStudyPacks;
  List<DocumentReference> get purchasedStudyPacks =>
      _purchasedStudyPacks ?? const [];
  bool hasPurchasedStudyPacks() => _purchasedStudyPacks != null;

  // "purchasedLevels" field.
  List<DocumentReference>? _purchasedLevels;
  List<DocumentReference> get purchasedLevels => _purchasedLevels ?? const [];
  bool hasPurchasedLevels() => _purchasedLevels != null;

  // "completeLessons" field.
  List<DocumentReference>? _completeLessons;
  List<DocumentReference> get completeLessons => _completeLessons ?? const [];
  bool hasCompleteLessons() => _completeLessons != null;

  // "purchasedCourses_dates" field.
  List<PurchasedCourseStruct>? _purchasedCoursesDates;
  List<PurchasedCourseStruct> get purchasedCoursesDates =>
      _purchasedCoursesDates ?? const [];
  bool hasPurchasedCoursesDates() => _purchasedCoursesDates != null;

  // "added_in_push" field.
  List<DocumentReference>? _addedInPush;
  List<DocumentReference> get addedInPush => _addedInPush ?? const [];
  bool hasAddedInPush() => _addedInPush != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _surname = snapshotData['surname'] as String?;
    _meditationsWishList = getDataList(snapshotData['meditationsWishList']);
    _viewedStories = getDataList(snapshotData['viewedStories']);
    _dailyAffirmation = snapshotData['dailyAffirmation'] as DocumentReference?;
    _listenedMeditations = getDataList(snapshotData['listenedMeditations']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _searchHistory = getDataList(snapshotData['searchHistory']);
    _purchasedMeditationsPacks =
        getDataList(snapshotData['purchasedMeditationsPacks']);
    _purchasedStudyPacks = getDataList(snapshotData['purchasedStudyPacks']);
    _purchasedLevels = getDataList(snapshotData['purchasedLevels']);
    _completeLessons = getDataList(snapshotData['completeLessons']);
    _purchasedCoursesDates = getStructList(
      snapshotData['purchasedCourses_dates'],
      PurchasedCourseStruct.fromMap,
    );
    _addedInPush = getDataList(snapshotData['added_in_push']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? surname,
  DocumentReference? dailyAffirmation,
  String? paymentMethod,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'surname': surname,
      'dailyAffirmation': dailyAffirmation,
      'paymentMethod': paymentMethod,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.surname == e2?.surname &&
        listEquality.equals(e1?.meditationsWishList, e2?.meditationsWishList) &&
        listEquality.equals(e1?.viewedStories, e2?.viewedStories) &&
        e1?.dailyAffirmation == e2?.dailyAffirmation &&
        listEquality.equals(e1?.listenedMeditations, e2?.listenedMeditations) &&
        e1?.paymentMethod == e2?.paymentMethod &&
        listEquality.equals(e1?.searchHistory, e2?.searchHistory) &&
        listEquality.equals(
            e1?.purchasedMeditationsPacks, e2?.purchasedMeditationsPacks) &&
        listEquality.equals(e1?.purchasedStudyPacks, e2?.purchasedStudyPacks) &&
        listEquality.equals(e1?.purchasedLevels, e2?.purchasedLevels) &&
        listEquality.equals(e1?.completeLessons, e2?.completeLessons) &&
        listEquality.equals(
            e1?.purchasedCoursesDates, e2?.purchasedCoursesDates) &&
        listEquality.equals(e1?.addedInPush, e2?.addedInPush);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.surname,
        e?.meditationsWishList,
        e?.viewedStories,
        e?.dailyAffirmation,
        e?.listenedMeditations,
        e?.paymentMethod,
        e?.searchHistory,
        e?.purchasedMeditationsPacks,
        e?.purchasedStudyPacks,
        e?.purchasedLevels,
        e?.completeLessons,
        e?.purchasedCoursesDates,
        e?.addedInPush
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
