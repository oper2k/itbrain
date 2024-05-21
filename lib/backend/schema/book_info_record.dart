import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BookInfoRecord extends FirestoreRecord {
  BookInfoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "photoCover" field.
  String? _photoCover;
  String get photoCover => _photoCover ?? '';
  bool hasPhotoCover() => _photoCover != null;

  // "aboutUrl" field.
  String? _aboutUrl;
  String get aboutUrl => _aboutUrl ?? '';
  bool hasAboutUrl() => _aboutUrl != null;

  // "codexAndPage" field.
  String? _codexAndPage;
  String get codexAndPage => _codexAndPage ?? '';
  bool hasCodexAndPage() => _codexAndPage != null;

  // "textTitle" field.
  String? _textTitle;
  String get textTitle => _textTitle ?? '';
  bool hasTextTitle() => _textTitle != null;

  // "isDownloadable" field.
  bool? _isDownloadable;
  bool get isDownloadable => _isDownloadable ?? false;
  bool hasIsDownloadable() => _isDownloadable != null;

  // "downloadLink" field.
  String? _downloadLink;
  String get downloadLink => _downloadLink ?? '';
  bool hasDownloadLink() => _downloadLink != null;

  // "listenLink" field.
  String? _listenLink;
  String get listenLink => _listenLink ?? '';
  bool hasListenLink() => _listenLink != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['Description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _photoCover = snapshotData['photoCover'] as String?;
    _aboutUrl = snapshotData['aboutUrl'] as String?;
    _codexAndPage = snapshotData['codexAndPage'] as String?;
    _textTitle = snapshotData['textTitle'] as String?;
    _isDownloadable = snapshotData['isDownloadable'] as bool?;
    _downloadLink = snapshotData['downloadLink'] as String?;
    _listenLink = snapshotData['listenLink'] as String?;
    _lang = snapshotData['lang'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookInfo');

  static Stream<BookInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookInfoRecord.fromSnapshot(s));

  static Future<BookInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookInfoRecord.fromSnapshot(s));

  static BookInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookInfoRecordData({
  String? title,
  String? description,
  String? photo,
  String? photoCover,
  String? aboutUrl,
  String? codexAndPage,
  String? textTitle,
  bool? isDownloadable,
  String? downloadLink,
  String? listenLink,
  String? lang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'Description': description,
      'photo': photo,
      'photoCover': photoCover,
      'aboutUrl': aboutUrl,
      'codexAndPage': codexAndPage,
      'textTitle': textTitle,
      'isDownloadable': isDownloadable,
      'downloadLink': downloadLink,
      'listenLink': listenLink,
      'lang': lang,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookInfoRecordDocumentEquality implements Equality<BookInfoRecord> {
  const BookInfoRecordDocumentEquality();

  @override
  bool equals(BookInfoRecord? e1, BookInfoRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.photoCover == e2?.photoCover &&
        e1?.aboutUrl == e2?.aboutUrl &&
        e1?.codexAndPage == e2?.codexAndPage &&
        e1?.textTitle == e2?.textTitle &&
        e1?.isDownloadable == e2?.isDownloadable &&
        e1?.downloadLink == e2?.downloadLink &&
        e1?.listenLink == e2?.listenLink &&
        e1?.lang == e2?.lang;
  }

  @override
  int hash(BookInfoRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.photo,
        e?.photoCover,
        e?.aboutUrl,
        e?.codexAndPage,
        e?.textTitle,
        e?.isDownloadable,
        e?.downloadLink,
        e?.listenLink,
        e?.lang
      ]);

  @override
  bool isValidKey(Object? o) => o is BookInfoRecord;
}
