import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MeditationsRecord extends FirestoreRecord {
  MeditationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "meditationCategory" field.
  DocumentReference? _meditationCategory;
  DocumentReference? get meditationCategory => _meditationCategory;
  bool hasMeditationCategory() => _meditationCategory != null;

  // "meditationAudio" field.
  DocumentReference? _meditationAudio;
  DocumentReference? get meditationAudio => _meditationAudio;
  bool hasMeditationAudio() => _meditationAudio != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "audioPath" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  bool hasAudioPath() => _audioPath != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "order" field.
  String? _order;
  String get order => _order ?? '';
  bool hasOrder() => _order != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title_eng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "duration_eng" field.
  String? _durationEng;
  String get durationEng => _durationEng ?? '';
  bool hasDurationEng() => _durationEng != null;

  // "description_eng" field.
  String? _descriptionEng;
  String get descriptionEng => _descriptionEng ?? '';
  bool hasDescriptionEng() => _descriptionEng != null;

  // "playerTitle" field.
  String? _playerTitle;
  String get playerTitle => _playerTitle ?? '';
  bool hasPlayerTitle() => _playerTitle != null;

  // "playerTitleEng" field.
  String? _playerTitleEng;
  String get playerTitleEng => _playerTitleEng ?? '';
  bool hasPlayerTitleEng() => _playerTitleEng != null;

  // "PlayerSubTitle" field.
  String? _playerSubTitle;
  String get playerSubTitle => _playerSubTitle ?? '';
  bool hasPlayerSubTitle() => _playerSubTitle != null;

  // "playerSubTitleEng" field.
  String? _playerSubTitleEng;
  String get playerSubTitleEng => _playerSubTitleEng ?? '';
  bool hasPlayerSubTitleEng() => _playerSubTitleEng != null;

  // "playerText" field.
  String? _playerText;
  String get playerText => _playerText ?? '';
  bool hasPlayerText() => _playerText != null;

  // "playerTextEng" field.
  String? _playerTextEng;
  String get playerTextEng => _playerTextEng ?? '';
  bool hasPlayerTextEng() => _playerTextEng != null;

  // "AudioPathEng" field.
  String? _audioPathEng;
  String get audioPathEng => _audioPathEng ?? '';
  bool hasAudioPathEng() => _audioPathEng != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  void _initializeFields() {
    _meditationCategory =
        snapshotData['meditationCategory'] as DocumentReference?;
    _meditationAudio = snapshotData['meditationAudio'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _duration = snapshotData['duration'] as String?;
    _audioPath = snapshotData['audioPath'] as String?;
    _description = snapshotData['description'] as String?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _order = snapshotData['order'] as String?;
    _image = snapshotData['image'] as String?;
    _titleEng = snapshotData['title_eng'] as String?;
    _durationEng = snapshotData['duration_eng'] as String?;
    _descriptionEng = snapshotData['description_eng'] as String?;
    _playerTitle = snapshotData['playerTitle'] as String?;
    _playerTitleEng = snapshotData['playerTitleEng'] as String?;
    _playerSubTitle = snapshotData['PlayerSubTitle'] as String?;
    _playerSubTitleEng = snapshotData['playerSubTitleEng'] as String?;
    _playerText = snapshotData['playerText'] as String?;
    _playerTextEng = snapshotData['playerTextEng'] as String?;
    _audioPathEng = snapshotData['AudioPathEng'] as String?;
    _lang = snapshotData['lang'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditations');

  static Stream<MeditationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationsRecord.fromSnapshot(s));

  static Future<MeditationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeditationsRecord.fromSnapshot(s));

  static MeditationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationsRecordData({
  DocumentReference? meditationCategory,
  DocumentReference? meditationAudio,
  String? title,
  String? duration,
  String? audioPath,
  String? description,
  bool? isPaid,
  DateTime? createdDate,
  String? type,
  String? order,
  String? image,
  String? titleEng,
  String? durationEng,
  String? descriptionEng,
  String? playerTitle,
  String? playerTitleEng,
  String? playerSubTitle,
  String? playerSubTitleEng,
  String? playerText,
  String? playerTextEng,
  String? audioPathEng,
  String? lang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meditationCategory': meditationCategory,
      'meditationAudio': meditationAudio,
      'title': title,
      'duration': duration,
      'audioPath': audioPath,
      'description': description,
      'isPaid': isPaid,
      'created_date': createdDate,
      'type': type,
      'order': order,
      'image': image,
      'title_eng': titleEng,
      'duration_eng': durationEng,
      'description_eng': descriptionEng,
      'playerTitle': playerTitle,
      'playerTitleEng': playerTitleEng,
      'PlayerSubTitle': playerSubTitle,
      'playerSubTitleEng': playerSubTitleEng,
      'playerText': playerText,
      'playerTextEng': playerTextEng,
      'AudioPathEng': audioPathEng,
      'lang': lang,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationsRecordDocumentEquality implements Equality<MeditationsRecord> {
  const MeditationsRecordDocumentEquality();

  @override
  bool equals(MeditationsRecord? e1, MeditationsRecord? e2) {
    return e1?.meditationCategory == e2?.meditationCategory &&
        e1?.meditationAudio == e2?.meditationAudio &&
        e1?.title == e2?.title &&
        e1?.duration == e2?.duration &&
        e1?.audioPath == e2?.audioPath &&
        e1?.description == e2?.description &&
        e1?.isPaid == e2?.isPaid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.type == e2?.type &&
        e1?.order == e2?.order &&
        e1?.image == e2?.image &&
        e1?.titleEng == e2?.titleEng &&
        e1?.durationEng == e2?.durationEng &&
        e1?.descriptionEng == e2?.descriptionEng &&
        e1?.playerTitle == e2?.playerTitle &&
        e1?.playerTitleEng == e2?.playerTitleEng &&
        e1?.playerSubTitle == e2?.playerSubTitle &&
        e1?.playerSubTitleEng == e2?.playerSubTitleEng &&
        e1?.playerText == e2?.playerText &&
        e1?.playerTextEng == e2?.playerTextEng &&
        e1?.audioPathEng == e2?.audioPathEng &&
        e1?.lang == e2?.lang;
  }

  @override
  int hash(MeditationsRecord? e) => const ListEquality().hash([
        e?.meditationCategory,
        e?.meditationAudio,
        e?.title,
        e?.duration,
        e?.audioPath,
        e?.description,
        e?.isPaid,
        e?.createdDate,
        e?.type,
        e?.order,
        e?.image,
        e?.titleEng,
        e?.durationEng,
        e?.descriptionEng,
        e?.playerTitle,
        e?.playerTitleEng,
        e?.playerSubTitle,
        e?.playerSubTitleEng,
        e?.playerText,
        e?.playerTextEng,
        e?.audioPathEng,
        e?.lang
      ]);

  @override
  bool isValidKey(Object? o) => o is MeditationsRecord;
}
