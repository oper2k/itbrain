import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioFilesRecord extends FirestoreRecord {
  AudioFilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

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

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _duration = snapshotData['duration'] as String?;
    _image = snapshotData['image'] as String?;
    _audioPath = snapshotData['audioPath'] as String?;
    _description = snapshotData['description'] as String?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _order = snapshotData['order'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audioFiles');

  static Stream<AudioFilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioFilesRecord.fromSnapshot(s));

  static Future<AudioFilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioFilesRecord.fromSnapshot(s));

  static AudioFilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioFilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioFilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioFilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioFilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioFilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioFilesRecordData({
  String? title,
  String? duration,
  String? image,
  String? audioPath,
  String? description,
  bool? isPaid,
  DateTime? createdDate,
  String? type,
  String? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'duration': duration,
      'image': image,
      'audioPath': audioPath,
      'description': description,
      'isPaid': isPaid,
      'created_date': createdDate,
      'type': type,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioFilesRecordDocumentEquality implements Equality<AudioFilesRecord> {
  const AudioFilesRecordDocumentEquality();

  @override
  bool equals(AudioFilesRecord? e1, AudioFilesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.duration == e2?.duration &&
        e1?.image == e2?.image &&
        e1?.audioPath == e2?.audioPath &&
        e1?.description == e2?.description &&
        e1?.isPaid == e2?.isPaid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.type == e2?.type &&
        e1?.order == e2?.order;
  }

  @override
  int hash(AudioFilesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.duration,
        e?.image,
        e?.audioPath,
        e?.description,
        e?.isPaid,
        e?.createdDate,
        e?.type,
        e?.order
      ]);

  @override
  bool isValidKey(Object? o) => o is AudioFilesRecord;
}
