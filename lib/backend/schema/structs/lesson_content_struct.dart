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
    String? photoEng,
    String? audioTitleEng,
    String? audioDurationEng,
    String? titleEng,
    String? bookTitleEng,
    String? bookTextEng,
    String? textAutorNameEng,
    String? textAutorPhotoEng,
    String? audioEng,
    String? textEng,
    String? audioDescription,
    String? audioDescriptionEng,
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
        _photoEng = photoEng,
        _audioTitleEng = audioTitleEng,
        _audioDurationEng = audioDurationEng,
        _titleEng = titleEng,
        _bookTitleEng = bookTitleEng,
        _bookTextEng = bookTextEng,
        _textAutorNameEng = textAutorNameEng,
        _textAutorPhotoEng = textAutorPhotoEng,
        _audioEng = audioEng,
        _textEng = textEng,
        _audioDescription = audioDescription,
        _audioDescriptionEng = audioDescriptionEng,
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

  // "photoEng" field.
  String? _photoEng;
  String get photoEng => _photoEng ?? '';
  set photoEng(String? val) => _photoEng = val;
  bool hasPhotoEng() => _photoEng != null;

  // "audioTitleEng" field.
  String? _audioTitleEng;
  String get audioTitleEng => _audioTitleEng ?? '';
  set audioTitleEng(String? val) => _audioTitleEng = val;
  bool hasAudioTitleEng() => _audioTitleEng != null;

  // "audioDurationEng" field.
  String? _audioDurationEng;
  String get audioDurationEng => _audioDurationEng ?? '';
  set audioDurationEng(String? val) => _audioDurationEng = val;
  bool hasAudioDurationEng() => _audioDurationEng != null;

  // "titleEng" field.
  String? _titleEng;
  String get titleEng => _titleEng ?? '';
  set titleEng(String? val) => _titleEng = val;
  bool hasTitleEng() => _titleEng != null;

  // "bookTitleEng" field.
  String? _bookTitleEng;
  String get bookTitleEng => _bookTitleEng ?? '';
  set bookTitleEng(String? val) => _bookTitleEng = val;
  bool hasBookTitleEng() => _bookTitleEng != null;

  // "bookTextEng" field.
  String? _bookTextEng;
  String get bookTextEng => _bookTextEng ?? '';
  set bookTextEng(String? val) => _bookTextEng = val;
  bool hasBookTextEng() => _bookTextEng != null;

  // "textAutorNameEng" field.
  String? _textAutorNameEng;
  String get textAutorNameEng => _textAutorNameEng ?? '';
  set textAutorNameEng(String? val) => _textAutorNameEng = val;
  bool hasTextAutorNameEng() => _textAutorNameEng != null;

  // "textAutorPhotoEng" field.
  String? _textAutorPhotoEng;
  String get textAutorPhotoEng => _textAutorPhotoEng ?? '';
  set textAutorPhotoEng(String? val) => _textAutorPhotoEng = val;
  bool hasTextAutorPhotoEng() => _textAutorPhotoEng != null;

  // "audioEng" field.
  String? _audioEng;
  String get audioEng => _audioEng ?? '';
  set audioEng(String? val) => _audioEng = val;
  bool hasAudioEng() => _audioEng != null;

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

  // "audioDescriptionEng" field.
  String? _audioDescriptionEng;
  String get audioDescriptionEng => _audioDescriptionEng ?? '';
  set audioDescriptionEng(String? val) => _audioDescriptionEng = val;
  bool hasAudioDescriptionEng() => _audioDescriptionEng != null;

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
        photoEng: data['photoEng'] as String?,
        audioTitleEng: data['audioTitleEng'] as String?,
        audioDurationEng: data['audioDurationEng'] as String?,
        titleEng: data['titleEng'] as String?,
        bookTitleEng: data['bookTitleEng'] as String?,
        bookTextEng: data['bookTextEng'] as String?,
        textAutorNameEng: data['textAutorNameEng'] as String?,
        textAutorPhotoEng: data['textAutorPhotoEng'] as String?,
        audioEng: data['audioEng'] as String?,
        textEng: data['textEng'] as String?,
        audioDescription: data['audioDescription'] as String?,
        audioDescriptionEng: data['audioDescriptionEng'] as String?,
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
        'photoEng': _photoEng,
        'audioTitleEng': _audioTitleEng,
        'audioDurationEng': _audioDurationEng,
        'titleEng': _titleEng,
        'bookTitleEng': _bookTitleEng,
        'bookTextEng': _bookTextEng,
        'textAutorNameEng': _textAutorNameEng,
        'textAutorPhotoEng': _textAutorPhotoEng,
        'audioEng': _audioEng,
        'textEng': _textEng,
        'audioDescription': _audioDescription,
        'audioDescriptionEng': _audioDescriptionEng,
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
        'photoEng': serializeParam(
          _photoEng,
          ParamType.String,
        ),
        'audioTitleEng': serializeParam(
          _audioTitleEng,
          ParamType.String,
        ),
        'audioDurationEng': serializeParam(
          _audioDurationEng,
          ParamType.String,
        ),
        'titleEng': serializeParam(
          _titleEng,
          ParamType.String,
        ),
        'bookTitleEng': serializeParam(
          _bookTitleEng,
          ParamType.String,
        ),
        'bookTextEng': serializeParam(
          _bookTextEng,
          ParamType.String,
        ),
        'textAutorNameEng': serializeParam(
          _textAutorNameEng,
          ParamType.String,
        ),
        'textAutorPhotoEng': serializeParam(
          _textAutorPhotoEng,
          ParamType.String,
        ),
        'audioEng': serializeParam(
          _audioEng,
          ParamType.String,
        ),
        'textEng': serializeParam(
          _textEng,
          ParamType.String,
        ),
        'audioDescription': serializeParam(
          _audioDescription,
          ParamType.String,
        ),
        'audioDescriptionEng': serializeParam(
          _audioDescriptionEng,
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
        photoEng: deserializeParam(
          data['photoEng'],
          ParamType.String,
          false,
        ),
        audioTitleEng: deserializeParam(
          data['audioTitleEng'],
          ParamType.String,
          false,
        ),
        audioDurationEng: deserializeParam(
          data['audioDurationEng'],
          ParamType.String,
          false,
        ),
        titleEng: deserializeParam(
          data['titleEng'],
          ParamType.String,
          false,
        ),
        bookTitleEng: deserializeParam(
          data['bookTitleEng'],
          ParamType.String,
          false,
        ),
        bookTextEng: deserializeParam(
          data['bookTextEng'],
          ParamType.String,
          false,
        ),
        textAutorNameEng: deserializeParam(
          data['textAutorNameEng'],
          ParamType.String,
          false,
        ),
        textAutorPhotoEng: deserializeParam(
          data['textAutorPhotoEng'],
          ParamType.String,
          false,
        ),
        audioEng: deserializeParam(
          data['audioEng'],
          ParamType.String,
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
        audioDescriptionEng: deserializeParam(
          data['audioDescriptionEng'],
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
        photoEng == other.photoEng &&
        audioTitleEng == other.audioTitleEng &&
        audioDurationEng == other.audioDurationEng &&
        titleEng == other.titleEng &&
        bookTitleEng == other.bookTitleEng &&
        bookTextEng == other.bookTextEng &&
        textAutorNameEng == other.textAutorNameEng &&
        textAutorPhotoEng == other.textAutorPhotoEng &&
        audioEng == other.audioEng &&
        textEng == other.textEng &&
        audioDescription == other.audioDescription &&
        audioDescriptionEng == other.audioDescriptionEng &&
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
        photoEng,
        audioTitleEng,
        audioDurationEng,
        titleEng,
        bookTitleEng,
        bookTextEng,
        textAutorNameEng,
        textAutorPhotoEng,
        audioEng,
        textEng,
        audioDescription,
        audioDescriptionEng,
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
  String? photoEng,
  String? audioTitleEng,
  String? audioDurationEng,
  String? titleEng,
  String? bookTitleEng,
  String? bookTextEng,
  String? textAutorNameEng,
  String? textAutorPhotoEng,
  String? audioEng,
  String? textEng,
  String? audioDescription,
  String? audioDescriptionEng,
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
      photoEng: photoEng,
      audioTitleEng: audioTitleEng,
      audioDurationEng: audioDurationEng,
      titleEng: titleEng,
      bookTitleEng: bookTitleEng,
      bookTextEng: bookTextEng,
      textAutorNameEng: textAutorNameEng,
      textAutorPhotoEng: textAutorPhotoEng,
      audioEng: audioEng,
      textEng: textEng,
      audioDescription: audioDescription,
      audioDescriptionEng: audioDescriptionEng,
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
