// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationAudioStruct extends FFFirebaseStruct {
  MeditationAudioStruct({
    String? name,
    String? description,
    String? audioPath,
    bool? isDownload,
    int? positionMS,
    int? durationMS,
    String? localImagePath,
    double? progress,
    String? localAudioPath,
    String? type,
    bool? isPaid,
    int? order,
    DateTime? createdDate,
    String? duration,
    String? id,
    String? photo,
    String? category,
    String? nameEng,
    String? descriptionName,
    String? durationEng,
    DocumentReference? meditationCategorg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _audioPath = audioPath,
        _isDownload = isDownload,
        _positionMS = positionMS,
        _durationMS = durationMS,
        _localImagePath = localImagePath,
        _progress = progress,
        _localAudioPath = localAudioPath,
        _type = type,
        _isPaid = isPaid,
        _order = order,
        _createdDate = createdDate,
        _duration = duration,
        _id = id,
        _photo = photo,
        _category = category,
        _nameEng = nameEng,
        _descriptionName = descriptionName,
        _durationEng = durationEng,
        _meditationCategorg = meditationCategorg,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "audioPath" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  set audioPath(String? val) => _audioPath = val;

  bool hasAudioPath() => _audioPath != null;

  // "isDownload" field.
  bool? _isDownload;
  bool get isDownload => _isDownload ?? false;
  set isDownload(bool? val) => _isDownload = val;

  bool hasIsDownload() => _isDownload != null;

  // "positionMS" field.
  int? _positionMS;
  int get positionMS => _positionMS ?? 0;
  set positionMS(int? val) => _positionMS = val;

  void incrementPositionMS(int amount) => positionMS = positionMS + amount;

  bool hasPositionMS() => _positionMS != null;

  // "durationMS" field.
  int? _durationMS;
  int get durationMS => _durationMS ?? 0;
  set durationMS(int? val) => _durationMS = val;

  void incrementDurationMS(int amount) => durationMS = durationMS + amount;

  bool hasDurationMS() => _durationMS != null;

  // "localImagePath" field.
  String? _localImagePath;
  String get localImagePath => _localImagePath ?? '';
  set localImagePath(String? val) => _localImagePath = val;

  bool hasLocalImagePath() => _localImagePath != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;

  void incrementProgress(double amount) => progress = progress + amount;

  bool hasProgress() => _progress != null;

  // "localAudioPath" field.
  String? _localAudioPath;
  String get localAudioPath => _localAudioPath ?? '';
  set localAudioPath(String? val) => _localAudioPath = val;

  bool hasLocalAudioPath() => _localAudioPath != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  set isPaid(bool? val) => _isPaid = val;

  bool hasIsPaid() => _isPaid != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  set createdDate(DateTime? val) => _createdDate = val;

  bool hasCreatedDate() => _createdDate != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "name_eng" field.
  String? _nameEng;
  String get nameEng => _nameEng ?? '';
  set nameEng(String? val) => _nameEng = val;

  bool hasNameEng() => _nameEng != null;

  // "description_name" field.
  String? _descriptionName;
  String get descriptionName => _descriptionName ?? '';
  set descriptionName(String? val) => _descriptionName = val;

  bool hasDescriptionName() => _descriptionName != null;

  // "duration_eng" field.
  String? _durationEng;
  String get durationEng => _durationEng ?? '';
  set durationEng(String? val) => _durationEng = val;

  bool hasDurationEng() => _durationEng != null;

  // "meditationCategorg" field.
  DocumentReference? _meditationCategorg;
  DocumentReference? get meditationCategorg => _meditationCategorg;
  set meditationCategorg(DocumentReference? val) => _meditationCategorg = val;

  bool hasMeditationCategorg() => _meditationCategorg != null;

  static MeditationAudioStruct fromMap(Map<String, dynamic> data) =>
      MeditationAudioStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        audioPath: data['audioPath'] as String?,
        isDownload: data['isDownload'] as bool?,
        positionMS: castToType<int>(data['positionMS']),
        durationMS: castToType<int>(data['durationMS']),
        localImagePath: data['localImagePath'] as String?,
        progress: castToType<double>(data['progress']),
        localAudioPath: data['localAudioPath'] as String?,
        type: data['type'] as String?,
        isPaid: data['isPaid'] as bool?,
        order: castToType<int>(data['order']),
        createdDate: data['created_date'] as DateTime?,
        duration: data['duration'] as String?,
        id: data['id'] as String?,
        photo: data['photo'] as String?,
        category: data['category'] as String?,
        nameEng: data['name_eng'] as String?,
        descriptionName: data['description_name'] as String?,
        durationEng: data['duration_eng'] as String?,
        meditationCategorg: data['meditationCategorg'] as DocumentReference?,
      );

  static MeditationAudioStruct? maybeFromMap(dynamic data) => data is Map
      ? MeditationAudioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'audioPath': _audioPath,
        'isDownload': _isDownload,
        'positionMS': _positionMS,
        'durationMS': _durationMS,
        'localImagePath': _localImagePath,
        'progress': _progress,
        'localAudioPath': _localAudioPath,
        'type': _type,
        'isPaid': _isPaid,
        'order': _order,
        'created_date': _createdDate,
        'duration': _duration,
        'id': _id,
        'photo': _photo,
        'category': _category,
        'name_eng': _nameEng,
        'description_name': _descriptionName,
        'duration_eng': _durationEng,
        'meditationCategorg': _meditationCategorg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'audioPath': serializeParam(
          _audioPath,
          ParamType.String,
        ),
        'isDownload': serializeParam(
          _isDownload,
          ParamType.bool,
        ),
        'positionMS': serializeParam(
          _positionMS,
          ParamType.int,
        ),
        'durationMS': serializeParam(
          _durationMS,
          ParamType.int,
        ),
        'localImagePath': serializeParam(
          _localImagePath,
          ParamType.String,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'localAudioPath': serializeParam(
          _localAudioPath,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'isPaid': serializeParam(
          _isPaid,
          ParamType.bool,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'created_date': serializeParam(
          _createdDate,
          ParamType.DateTime,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'name_eng': serializeParam(
          _nameEng,
          ParamType.String,
        ),
        'description_name': serializeParam(
          _descriptionName,
          ParamType.String,
        ),
        'duration_eng': serializeParam(
          _durationEng,
          ParamType.String,
        ),
        'meditationCategorg': serializeParam(
          _meditationCategorg,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MeditationAudioStruct fromSerializableMap(Map<String, dynamic> data) =>
      MeditationAudioStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        audioPath: deserializeParam(
          data['audioPath'],
          ParamType.String,
          false,
        ),
        isDownload: deserializeParam(
          data['isDownload'],
          ParamType.bool,
          false,
        ),
        positionMS: deserializeParam(
          data['positionMS'],
          ParamType.int,
          false,
        ),
        durationMS: deserializeParam(
          data['durationMS'],
          ParamType.int,
          false,
        ),
        localImagePath: deserializeParam(
          data['localImagePath'],
          ParamType.String,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        localAudioPath: deserializeParam(
          data['localAudioPath'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        isPaid: deserializeParam(
          data['isPaid'],
          ParamType.bool,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        createdDate: deserializeParam(
          data['created_date'],
          ParamType.DateTime,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        nameEng: deserializeParam(
          data['name_eng'],
          ParamType.String,
          false,
        ),
        descriptionName: deserializeParam(
          data['description_name'],
          ParamType.String,
          false,
        ),
        durationEng: deserializeParam(
          data['duration_eng'],
          ParamType.String,
          false,
        ),
        meditationCategorg: deserializeParam(
          data['meditationCategorg'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['meditationCategories'],
        ),
      );

  @override
  String toString() => 'MeditationAudioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MeditationAudioStruct &&
        name == other.name &&
        description == other.description &&
        audioPath == other.audioPath &&
        isDownload == other.isDownload &&
        positionMS == other.positionMS &&
        durationMS == other.durationMS &&
        localImagePath == other.localImagePath &&
        progress == other.progress &&
        localAudioPath == other.localAudioPath &&
        type == other.type &&
        isPaid == other.isPaid &&
        order == other.order &&
        createdDate == other.createdDate &&
        duration == other.duration &&
        id == other.id &&
        photo == other.photo &&
        category == other.category &&
        nameEng == other.nameEng &&
        descriptionName == other.descriptionName &&
        durationEng == other.durationEng &&
        meditationCategorg == other.meditationCategorg;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        audioPath,
        isDownload,
        positionMS,
        durationMS,
        localImagePath,
        progress,
        localAudioPath,
        type,
        isPaid,
        order,
        createdDate,
        duration,
        id,
        photo,
        category,
        nameEng,
        descriptionName,
        durationEng,
        meditationCategorg
      ]);
}

MeditationAudioStruct createMeditationAudioStruct({
  String? name,
  String? description,
  String? audioPath,
  bool? isDownload,
  int? positionMS,
  int? durationMS,
  String? localImagePath,
  double? progress,
  String? localAudioPath,
  String? type,
  bool? isPaid,
  int? order,
  DateTime? createdDate,
  String? duration,
  String? id,
  String? photo,
  String? category,
  String? nameEng,
  String? descriptionName,
  String? durationEng,
  DocumentReference? meditationCategorg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MeditationAudioStruct(
      name: name,
      description: description,
      audioPath: audioPath,
      isDownload: isDownload,
      positionMS: positionMS,
      durationMS: durationMS,
      localImagePath: localImagePath,
      progress: progress,
      localAudioPath: localAudioPath,
      type: type,
      isPaid: isPaid,
      order: order,
      createdDate: createdDate,
      duration: duration,
      id: id,
      photo: photo,
      category: category,
      nameEng: nameEng,
      descriptionName: descriptionName,
      durationEng: durationEng,
      meditationCategorg: meditationCategorg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MeditationAudioStruct? updateMeditationAudioStruct(
  MeditationAudioStruct? meditationAudio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meditationAudio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMeditationAudioStructData(
  Map<String, dynamic> firestoreData,
  MeditationAudioStruct? meditationAudio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meditationAudio == null) {
    return;
  }
  if (meditationAudio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && meditationAudio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final meditationAudioData =
      getMeditationAudioFirestoreData(meditationAudio, forFieldValue);
  final nestedData =
      meditationAudioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meditationAudio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMeditationAudioFirestoreData(
  MeditationAudioStruct? meditationAudio, [
  bool forFieldValue = false,
]) {
  if (meditationAudio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meditationAudio.toMap());

  // Add any Firestore field values
  meditationAudio.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMeditationAudioListFirestoreData(
  List<MeditationAudioStruct>? meditationAudios,
) =>
    meditationAudios
        ?.map((e) => getMeditationAudioFirestoreData(e, true))
        .toList() ??
    [];
