import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "titleEng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "durationEng" field.
  String? _durationEng;
  String get durationEng => _durationEng ?? '';
  bool hasDurationEng() => _durationEng != null;

  // "videoCover" field.
  String? _videoCover;
  String get videoCover => _videoCover ?? '';
  bool hasVideoCover() => _videoCover != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _duration = snapshotData['duration'] as String?;
    _titleEng = snapshotData['titleEng'] as String?;
    _durationEng = snapshotData['durationEng'] as String?;
    _videoCover = snapshotData['videoCover'] as String?;
    _lang = snapshotData['lang'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? title,
  String? videoUrl,
  String? duration,
  String? titleEng,
  String? durationEng,
  String? videoCover,
  String? lang,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'video_url': videoUrl,
      'duration': duration,
      'titleEng': titleEng,
      'durationEng': durationEng,
      'videoCover': videoCover,
      'lang': lang,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.duration == e2?.duration &&
        e1?.titleEng == e2?.titleEng &&
        e1?.durationEng == e2?.durationEng &&
        e1?.videoCover == e2?.videoCover &&
        e1?.lang == e2?.lang &&
        e1?.order == e2?.order;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.title,
        e?.videoUrl,
        e?.duration,
        e?.titleEng,
        e?.durationEng,
        e?.videoCover,
        e?.lang,
        e?.order
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
