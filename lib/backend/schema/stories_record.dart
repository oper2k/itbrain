import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "visability" field.
  bool? _visability;
  bool get visability => _visability ?? false;
  bool hasVisability() => _visability != null;

  // "contentStories" field.
  List<StoriesStruct>? _contentStories;
  List<StoriesStruct> get contentStories => _contentStories ?? const [];
  bool hasContentStories() => _contentStories != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "title_eng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  bool hasTitleEng() => _titleEng != null;

  // "homeTitle" field.
  String? _homeTitle;
  String get homeTitle => _homeTitle ?? '';
  bool hasHomeTitle() => _homeTitle != null;

  // "homeTitleEng" field.
  String? _homeTitleEng;
  String get homeTitleEng => _homeTitleEng ?? '';
  bool hasHomeTitleEng() => _homeTitleEng != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _visability = snapshotData['visability'] as bool?;
    _contentStories = getStructList(
      snapshotData['contentStories'],
      StoriesStruct.fromMap,
    );
    _createDate = snapshotData['create_date'] as DateTime?;
    _lang = snapshotData['lang'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _titleEng = snapshotData['title_eng'] as String?;
    _homeTitle = snapshotData['homeTitle'] as String?;
    _homeTitleEng = snapshotData['homeTitleEng'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  String? title,
  String? image,
  bool? visability,
  DateTime? createDate,
  String? lang,
  int? index,
  String? titleEng,
  String? homeTitle,
  String? homeTitleEng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'visability': visability,
      'create_date': createDate,
      'lang': lang,
      'index': index,
      'title_eng': titleEng,
      'homeTitle': homeTitle,
      'homeTitleEng': homeTitleEng,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.visability == e2?.visability &&
        listEquality.equals(e1?.contentStories, e2?.contentStories) &&
        e1?.createDate == e2?.createDate &&
        e1?.lang == e2?.lang &&
        e1?.index == e2?.index &&
        e1?.titleEng == e2?.titleEng &&
        e1?.homeTitle == e2?.homeTitle &&
        e1?.homeTitleEng == e2?.homeTitleEng;
  }

  @override
  int hash(StoriesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.image,
        e?.visability,
        e?.contentStories,
        e?.createDate,
        e?.lang,
        e?.index,
        e?.titleEng,
        e?.homeTitle,
        e?.homeTitleEng
      ]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
