import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BooksPagesRecord extends FirestoreRecord {
  BooksPagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "book" field.
  DocumentReference? _book;
  DocumentReference? get book => _book;
  bool hasBook() => _book != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "textTitle" field.
  String? _textTitle;
  String get textTitle => _textTitle ?? '';
  bool hasTextTitle() => _textTitle != null;

  // "mainText" field.
  String? _mainText;
  String get mainText => _mainText ?? '';
  bool hasMainText() => _mainText != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  void _initializeFields() {
    _book = snapshotData['book'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _textTitle = snapshotData['textTitle'] as String?;
    _mainText = snapshotData['mainText'] as String?;
    _lang = snapshotData['lang'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booksPages');

  static Stream<BooksPagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BooksPagesRecord.fromSnapshot(s));

  static Future<BooksPagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BooksPagesRecord.fromSnapshot(s));

  static BooksPagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BooksPagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BooksPagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BooksPagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BooksPagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BooksPagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBooksPagesRecordData({
  DocumentReference? book,
  String? title,
  String? description,
  String? photo,
  String? textTitle,
  String? mainText,
  String? lang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book': book,
      'title': title,
      'description': description,
      'photo': photo,
      'textTitle': textTitle,
      'mainText': mainText,
      'lang': lang,
    }.withoutNulls,
  );

  return firestoreData;
}

class BooksPagesRecordDocumentEquality implements Equality<BooksPagesRecord> {
  const BooksPagesRecordDocumentEquality();

  @override
  bool equals(BooksPagesRecord? e1, BooksPagesRecord? e2) {
    return e1?.book == e2?.book &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.textTitle == e2?.textTitle &&
        e1?.mainText == e2?.mainText &&
        e1?.lang == e2?.lang;
  }

  @override
  int hash(BooksPagesRecord? e) => const ListEquality().hash([
        e?.book,
        e?.title,
        e?.description,
        e?.photo,
        e?.textTitle,
        e?.mainText,
        e?.lang
      ]);

  @override
  bool isValidKey(Object? o) => o is BooksPagesRecord;
}
