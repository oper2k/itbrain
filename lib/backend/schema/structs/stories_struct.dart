// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesStruct extends FFFirebaseStruct {
  StoriesStruct({
    String? image,
    String? video,
    int? time,
    String? imageEng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _video = video,
        _time = time,
        _imageEng = imageEng,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  set time(int? val) => _time = val;
  void incrementTime(int amount) => _time = time + amount;
  bool hasTime() => _time != null;

  // "imageEng" field.
  String? _imageEng;
  String get imageEng => _imageEng ?? '';
  set imageEng(String? val) => _imageEng = val;
  bool hasImageEng() => _imageEng != null;

  static StoriesStruct fromMap(Map<String, dynamic> data) => StoriesStruct(
        image: data['image'] as String?,
        video: data['video'] as String?,
        time: castToType<int>(data['time']),
        imageEng: data['imageEng'] as String?,
      );

  static StoriesStruct? maybeFromMap(dynamic data) =>
      data is Map ? StoriesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'video': _video,
        'time': _time,
        'imageEng': _imageEng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.int,
        ),
        'imageEng': serializeParam(
          _imageEng,
          ParamType.String,
        ),
      }.withoutNulls;

  static StoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      StoriesStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.int,
          false,
        ),
        imageEng: deserializeParam(
          data['imageEng'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StoriesStruct &&
        image == other.image &&
        video == other.video &&
        time == other.time &&
        imageEng == other.imageEng;
  }

  @override
  int get hashCode => const ListEquality().hash([image, video, time, imageEng]);
}

StoriesStruct createStoriesStruct({
  String? image,
  String? video,
  int? time,
  String? imageEng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StoriesStruct(
      image: image,
      video: video,
      time: time,
      imageEng: imageEng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StoriesStruct? updateStoriesStruct(
  StoriesStruct? stories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStoriesStructData(
  Map<String, dynamic> firestoreData,
  StoriesStruct? stories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stories == null) {
    return;
  }
  if (stories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final storiesData = getStoriesFirestoreData(stories, forFieldValue);
  final nestedData = storiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStoriesFirestoreData(
  StoriesStruct? stories, [
  bool forFieldValue = false,
]) {
  if (stories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stories.toMap());

  // Add any Firestore field values
  stories.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStoriesListFirestoreData(
  List<StoriesStruct>? storiess,
) =>
    storiess?.map((e) => getStoriesFirestoreData(e, true)).toList() ?? [];
