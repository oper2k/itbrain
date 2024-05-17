import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FfCustomPushNotificationsRecord extends FirestoreRecord {
  FfCustomPushNotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "isRepeat" field.
  bool? _isRepeat;
  bool get isRepeat => _isRepeat ?? false;
  bool hasIsRepeat() => _isRepeat != null;

  // "repeatInterval" field.
  String? _repeatInterval;
  String get repeatInterval => _repeatInterval ?? '';
  bool hasRepeatInterval() => _repeatInterval != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "target_audience" field.
  String? _targetAudience;
  String get targetAudience => _targetAudience ?? '';
  bool hasTargetAudience() => _targetAudience != null;

  // "user_refs" field.
  String? _userRefs;
  String get userRefs => _userRefs ?? '';
  bool hasUserRefs() => _userRefs != null;

  // "variable" field.
  String? _variable;
  String get variable => _variable ?? '';
  bool hasVariable() => _variable != null;

  // "parameter_data" field.
  String? _parameterData;
  String get parameterData => _parameterData ?? '';
  bool hasParameterData() => _parameterData != null;

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  bool hasNotificationTitle() => _notificationTitle != null;

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "conditionValue" field.
  String? _conditionValue;
  String get conditionValue => _conditionValue ?? '';
  bool hasConditionValue() => _conditionValue != null;

  // "initial_page_name" field.
  String? _initialPageName;
  String get initialPageName => _initialPageName ?? '';
  bool hasInitialPageName() => _initialPageName != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "scheduled_time" field.
  DateTime? _scheduledTime;
  DateTime? get scheduledTime => _scheduledTime;
  bool hasScheduledTime() => _scheduledTime != null;

  // "notification_sound" field.
  String? _notificationSound;
  String get notificationSound => _notificationSound ?? '';
  bool hasNotificationSound() => _notificationSound != null;

  // "notification_image_url" field.
  String? _notificationImageUrl;
  String get notificationImageUrl => _notificationImageUrl ?? '';
  bool hasNotificationImageUrl() => _notificationImageUrl != null;

  void _initializeFields() {
    _tag = snapshotData['tag'] as String?;
    _isRepeat = snapshotData['isRepeat'] as bool?;
    _repeatInterval = snapshotData['repeatInterval'] as String?;
    _status = snapshotData['status'] as String?;
    _targetAudience = snapshotData['target_audience'] as String?;
    _userRefs = snapshotData['user_refs'] as String?;
    _variable = snapshotData['variable'] as String?;
    _parameterData = snapshotData['parameter_data'] as String?;
    _notificationTitle = snapshotData['notification_title'] as String?;
    _notificationText = snapshotData['notification_text'] as String?;
    _condition = snapshotData['condition'] as String?;
    _conditionValue = snapshotData['conditionValue'] as String?;
    _initialPageName = snapshotData['initial_page_name'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _scheduledTime = snapshotData['scheduled_time'] as DateTime?;
    _notificationSound = snapshotData['notification_sound'] as String?;
    _notificationImageUrl = snapshotData['notification_image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ff_custom_push_notifications');

  static Stream<FfCustomPushNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => FfCustomPushNotificationsRecord.fromSnapshot(s));

  static Future<FfCustomPushNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FfCustomPushNotificationsRecord.fromSnapshot(s));

  static FfCustomPushNotificationsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FfCustomPushNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FfCustomPushNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FfCustomPushNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FfCustomPushNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FfCustomPushNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFfCustomPushNotificationsRecordData({
  String? tag,
  bool? isRepeat,
  String? repeatInterval,
  String? status,
  String? targetAudience,
  String? userRefs,
  String? variable,
  String? parameterData,
  String? notificationTitle,
  String? notificationText,
  String? condition,
  String? conditionValue,
  String? initialPageName,
  DateTime? timestamp,
  DateTime? scheduledTime,
  String? notificationSound,
  String? notificationImageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tag': tag,
      'isRepeat': isRepeat,
      'repeatInterval': repeatInterval,
      'status': status,
      'target_audience': targetAudience,
      'user_refs': userRefs,
      'variable': variable,
      'parameter_data': parameterData,
      'notification_title': notificationTitle,
      'notification_text': notificationText,
      'condition': condition,
      'conditionValue': conditionValue,
      'initial_page_name': initialPageName,
      'timestamp': timestamp,
      'scheduled_time': scheduledTime,
      'notification_sound': notificationSound,
      'notification_image_url': notificationImageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class FfCustomPushNotificationsRecordDocumentEquality
    implements Equality<FfCustomPushNotificationsRecord> {
  const FfCustomPushNotificationsRecordDocumentEquality();

  @override
  bool equals(FfCustomPushNotificationsRecord? e1,
      FfCustomPushNotificationsRecord? e2) {
    return e1?.tag == e2?.tag &&
        e1?.isRepeat == e2?.isRepeat &&
        e1?.repeatInterval == e2?.repeatInterval &&
        e1?.status == e2?.status &&
        e1?.targetAudience == e2?.targetAudience &&
        e1?.userRefs == e2?.userRefs &&
        e1?.variable == e2?.variable &&
        e1?.parameterData == e2?.parameterData &&
        e1?.notificationTitle == e2?.notificationTitle &&
        e1?.notificationText == e2?.notificationText &&
        e1?.condition == e2?.condition &&
        e1?.conditionValue == e2?.conditionValue &&
        e1?.initialPageName == e2?.initialPageName &&
        e1?.timestamp == e2?.timestamp &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.notificationSound == e2?.notificationSound &&
        e1?.notificationImageUrl == e2?.notificationImageUrl;
  }

  @override
  int hash(FfCustomPushNotificationsRecord? e) => const ListEquality().hash([
        e?.tag,
        e?.isRepeat,
        e?.repeatInterval,
        e?.status,
        e?.targetAudience,
        e?.userRefs,
        e?.variable,
        e?.parameterData,
        e?.notificationTitle,
        e?.notificationText,
        e?.condition,
        e?.conditionValue,
        e?.initialPageName,
        e?.timestamp,
        e?.scheduledTime,
        e?.notificationSound,
        e?.notificationImageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is FfCustomPushNotificationsRecord;
}
