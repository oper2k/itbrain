// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonContentStruct extends FFFirebaseStruct {
  LessonContentStruct({
    String? photo,
    ContentType? type,
    bool? showDivider,
    String? text,
    String? audio,
    String? audioTitle,
    String? audioDuration,
    String? title,
    String? bookTitle,
    String? bookText,
    String? textAutorName,
    String? textAutorPhoto,
    int? order,
    String? textEng,
    String? audioDescription,
    String? createdByPhoto,
    String? lang,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photo = photo,
        _type = type,
        _showDivider = showDivider,
        _text = text,
        _audio = audio,
        _audioTitle = audioTitle,
        _audioDuration = audioDuration,
        _title = title,
        _bookTitle = bookTitle,
        _bookText = bookText,
        _textAutorName = textAutorName,
        _textAutorPhoto = textAutorPhoto,
        _order = order,
        _textEng = textEng,
        _audioDescription = audioDescription,
        _createdByPhoto = createdByPhoto,
        _lang = lang,
        super(firestoreUtilData);

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  // "type" field.
  ContentType? _type;
  ContentType? get type => _type;
  set type(ContentType? val) => _type = val;
  bool hasType() => _type != null;

  // "showDivider" field.
  bool? _showDivider;
  bool get showDivider => _showDivider ?? false;
  set showDivider(bool? val) => _showDivider = val;
  bool hasShowDivider() => _showDivider != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  set audio(String? val) => _audio = val;
  bool hasAudio() => _audio != null;

  // "audioTitle" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  set audioTitle(String? val) => _audioTitle = val;
  bool hasAudioTitle() => _audioTitle != null;

  // "audioDuration" field.
  String? _audioDuration;
  String get audioDuration => _audioDuration ?? '';
  set audioDuration(String? val) => _audioDuration = val;
  bool hasAudioDuration() => _audioDuration != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "bookTitle" field.
  String? _bookTitle;
  String get bookTitle => _bookTitle ?? '';
  set bookTitle(String? val) => _bookTitle = val;
  bool hasBookTitle() => _bookTitle != null;

  // "bookText" field.
  String? _bookText;
  String get bookText => _bookText ?? '';
  set bookText(String? val) => _bookText = val;
  bool hasBookText() => _bookText != null;

  // "textAutorName" field.
  String? _textAutorName;
  String get textAutorName => _textAutorName ?? '';
  set textAutorName(String? val) => _textAutorName = val;
  bool hasTextAutorName() => _textAutorName != null;

  // "textAutorPhoto" field.
  String? _textAutorPhoto;
  String get textAutorPhoto => _textAutorPhoto ?? '';
  set textAutorPhoto(String? val) => _textAutorPhoto = val;
  bool hasTextAutorPhoto() => _textAutorPhoto != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;
  void incrementOrder(int amount) => _order = order + amount;
  bool hasOrder() => _order != null;

  // "textEng" field.
  String? _textEng;
  String get textEng => _textEng ?? '';
  set textEng(String? val) => _textEng = val;
  bool hasTextEng() => _textEng != null;

  // "audioDescription" field.
  String? _audioDescription;
  String get audioDescription => _audioDescription ?? '';
  set audioDescription(String? val) => _audioDescription = val;
  bool hasAudioDescription() => _audioDescription != null;

  // "createdByPhoto" field.
  String? _createdByPhoto;
  String get createdByPhoto => _createdByPhoto ?? '';
  set createdByPhoto(String? val) => _createdByPhoto = val;
  bool hasCreatedByPhoto() => _createdByPhoto != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  set lang(String? val) => _lang = val;
  bool hasLang() => _lang != null;

  static LessonContentStruct fromMap(Map<String, dynamic> data) =>
      LessonContentStruct(
        photo: data['photo'] as String?,
        type: deserializeEnum<ContentType>(data['type']),
        showDivider: data['showDivider'] as bool?,
        text: data['text'] as String?,
        audio: data['audio'] as String?,
        audioTitle: data['audioTitle'] as String?,
        audioDuration: data['audioDuration'] as String?,
        title: data['title'] as String?,
        bookTitle: data['bookTitle'] as String?,
        bookText: data['bookText'] as String?,
        textAutorName: data['textAutorName'] as String?,
        textAutorPhoto: data['textAutorPhoto'] as String?,
        order: castToType<int>(data['order']),
        textEng: data['textEng'] as String?,
        audioDescription: data['audioDescription'] as String?,
        createdByPhoto: data['createdByPhoto'] as String?,
        lang: data['lang'] as String?,
      );

  static LessonContentStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo': _photo,
        'type': _type?.serialize(),
        'showDivider': _showDivider,
        'text': _text,
        'audio': _audio,
        'audioTitle': _audioTitle,
        'audioDuration': _audioDuration,
        'title': _title,
        'bookTitle': _bookTitle,
        'bookText': _bookText,
        'textAutorName': _textAutorName,
        'textAutorPhoto': _textAutorPhoto,
        'order': _order,
        'textEng': _textEng,
        'audioDescription': _audioDescription,
        'createdByPhoto': _createdByPhoto,
        'lang': _lang,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'showDivider': serializeParam(
          _showDivider,
          ParamType.bool,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'audio': serializeParam(
          _audio,
          ParamType.String,
        ),
        'audioTitle': serializeParam(
          _audioTitle,
          ParamType.String,
        ),
        'audioDuration': serializeParam(
          _audioDuration,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'bookTitle': serializeParam(
          _bookTitle,
          ParamType.String,
        ),
        'bookText': serializeParam(
          _bookText,
          ParamType.String,
        ),
        'textAutorName': serializeParam(
          _textAutorName,
          ParamType.String,
        ),
        'textAutorPhoto': serializeParam(
          _textAutorPhoto,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'textEng': serializeParam(
          _textEng,
          ParamType.String,
        ),
        'audioDescription': serializeParam(
          _audioDescription,
          ParamType.String,
        ),
        'createdByPhoto': serializeParam(
          _createdByPhoto,
          ParamType.String,
        ),
        'lang': serializeParam(
          _lang,
          ParamType.String,
        ),
      }.withoutNulls;

  static LessonContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonContentStruct(
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<ContentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        showDivider: deserializeParam(
          data['showDivider'],
          ParamType.bool,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        audio: deserializeParam(
          data['audio'],
          ParamType.String,
          false,
        ),
        audioTitle: deserializeParam(
          data['audioTitle'],
          ParamType.String,
          false,
        ),
        audioDuration: deserializeParam(
          data['audioDuration'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        bookTitle: deserializeParam(
          data['bookTitle'],
          ParamType.String,
          false,
        ),
        bookText: deserializeParam(
          data['bookText'],
          ParamType.String,
          false,
        ),
        textAutorName: deserializeParam(
          data['textAutorName'],
          ParamType.String,
          false,
        ),
        textAutorPhoto: deserializeParam(
          data['textAutorPhoto'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        textEng: deserializeParam(
          data['textEng'],
          ParamType.String,
          false,
        ),
        audioDescription: deserializeParam(
          data['audioDescription'],
          ParamType.String,
          false,
        ),
        createdByPhoto: deserializeParam(
          data['createdByPhoto'],
          ParamType.String,
          false,
        ),
        lang: deserializeParam(
          data['lang'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LessonContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonContentStruct &&
        photo == other.photo &&
        type == other.type &&
        showDivider == other.showDivider &&
        text == other.text &&
        audio == other.audio &&
        audioTitle == other.audioTitle &&
        audioDuration == other.audioDuration &&
        title == other.title &&
        bookTitle == other.bookTitle &&
        bookText == other.bookText &&
        textAutorName == other.textAutorName &&
        textAutorPhoto == other.textAutorPhoto &&
        order == other.order &&
        textEng == other.textEng &&
        audioDescription == other.audioDescription &&
        createdByPhoto == other.createdByPhoto &&
        lang == other.lang;
  }

  @override
  int get hashCode => const ListEquality().hash([
        photo,
        type,
        showDivider,
        text,
        audio,
        audioTitle,
        audioDuration,
        title,
        bookTitle,
        bookText,
        textAutorName,
        textAutorPhoto,
        order,
        textEng,
        audioDescription,
        createdByPhoto,
        lang
      ]);
}

LessonContentStruct createLessonContentStruct({
  String? photo,
  ContentType? type,
  bool? showDivider,
  String? text,
  String? audio,
  String? audioTitle,
  String? audioDuration,
  String? title,
  String? bookTitle,
  String? bookText,
  String? textAutorName,
  String? textAutorPhoto,
  int? order,
  String? textEng,
  String? audioDescription,
  String? createdByPhoto,
  String? lang,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonContentStruct(
      photo: photo,
      type: type,
      showDivider: showDivider,
      text: text,
      audio: audio,
      audioTitle: audioTitle,
      audioDuration: audioDuration,
      title: title,
      bookTitle: bookTitle,
      bookText: bookText,
      textAutorName: textAutorName,
      textAutorPhoto: textAutorPhoto,
      order: order,
      textEng: textEng,
      audioDescription: audioDescription,
      createdByPhoto: createdByPhoto,
      lang: lang,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonContentStruct? updateLessonContentStruct(
  LessonContentStruct? lessonContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonContentStructData(
  Map<String, dynamic> firestoreData,
  LessonContentStruct? lessonContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonContent == null) {
    return;
  }
  if (lessonContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonContentData =
      getLessonContentFirestoreData(lessonContent, forFieldValue);
  final nestedData =
      lessonContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lessonContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonContentFirestoreData(
  LessonContentStruct? lessonContent, [
  bool forFieldValue = false,
]) {
  if (lessonContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonContent.toMap());

  // Add any Firestore field values
  lessonContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonContentListFirestoreData(
  List<LessonContentStruct>? lessonContents,
) =>
    lessonContents
        ?.map((e) => getLessonContentFirestoreData(e, true))
        .toList() ??
    [];
