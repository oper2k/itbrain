import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastDateShowAffirmation = prefs.containsKey('ff_lastDateShowAffirmation')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastDateShowAffirmation')!)
          : _lastDateShowAffirmation;
    });
    _safeInit(() {
      _lastShowAffirmation = prefs.getString('ff_lastShowAffirmation')?.ref ??
          _lastShowAffirmation;
    });
    _safeInit(() {
      _currentStory = prefs.getString('ff_currentStory')?.ref ?? _currentStory;
    });
    _safeInit(() {
      _imageProfileBlurHash =
          prefs.getString('ff_imageProfileBlurHash') ?? _imageProfileBlurHash;
    });
    _safeInit(() {
      _isAudioPlaying = prefs.getBool('ff_isAudioPlaying') ?? _isAudioPlaying;
    });
    _safeInit(() {
      _downloadedTracks = prefs
              .getStringList('ff_downloadedTracks')
              ?.map((x) {
                try {
                  return MeditationAudioStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _downloadedTracks;
    });
    _safeInit(() {
      _searchHistory = prefs
              .getStringList('ff_searchHistory')
              ?.map((path) => path.ref)
              .toList() ??
          _searchHistory;
    });
    _safeInit(() {
      _enLang = prefs.getBool('ff_enLang') ?? _enLang;
    });
    _safeInit(() {
      _ruLang = prefs.getBool('ff_ruLang') ?? _ruLang;
    });
    _safeInit(() {
      _LastAffirmationDate =
          prefs.getString('ff_LastAffirmationDate') ?? _LastAffirmationDate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _lastDateShowAffirmation =
      DateTime.fromMillisecondsSinceEpoch(1705494720000);
  DateTime? get lastDateShowAffirmation => _lastDateShowAffirmation;
  set lastDateShowAffirmation(DateTime? _value) {
    _lastDateShowAffirmation = _value;
    _value != null
        ? prefs.setInt(
            'ff_lastDateShowAffirmation', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastDateShowAffirmation');
  }

  DocumentReference? _lastShowAffirmation;
  DocumentReference? get lastShowAffirmation => _lastShowAffirmation;
  set lastShowAffirmation(DocumentReference? _value) {
    _lastShowAffirmation = _value;
    _value != null
        ? prefs.setString('ff_lastShowAffirmation', _value.path)
        : prefs.remove('ff_lastShowAffirmation');
  }

  DocumentReference? _currentStory;
  DocumentReference? get currentStory => _currentStory;
  set currentStory(DocumentReference? _value) {
    _currentStory = _value;
    _value != null
        ? prefs.setString('ff_currentStory', _value.path)
        : prefs.remove('ff_currentStory');
  }

  String _imageProfileBlurHash = '';
  String get imageProfileBlurHash => _imageProfileBlurHash;
  set imageProfileBlurHash(String _value) {
    _imageProfileBlurHash = _value;
    prefs.setString('ff_imageProfileBlurHash', _value);
  }

  bool _isAudioPlaying = false;
  bool get isAudioPlaying => _isAudioPlaying;
  set isAudioPlaying(bool _value) {
    _isAudioPlaying = _value;
    prefs.setBool('ff_isAudioPlaying', _value);
  }

  int _positionMS = 0;
  int get positionMS => _positionMS;
  set positionMS(int _value) {
    _positionMS = _value;
  }

  int _durationMS = 0;
  int get durationMS => _durationMS;
  set durationMS(int _value) {
    _durationMS = _value;
  }

  List<MeditationAudioStruct> _downloadingTracks = [];
  List<MeditationAudioStruct> get downloadingTracks => _downloadingTracks;
  set downloadingTracks(List<MeditationAudioStruct> _value) {
    _downloadingTracks = _value;
  }

  void addToDownloadingTracks(MeditationAudioStruct _value) {
    _downloadingTracks.add(_value);
  }

  void removeFromDownloadingTracks(MeditationAudioStruct _value) {
    _downloadingTracks.remove(_value);
  }

  void removeAtIndexFromDownloadingTracks(int _index) {
    _downloadingTracks.removeAt(_index);
  }

  void updateDownloadingTracksAtIndex(
    int _index,
    MeditationAudioStruct Function(MeditationAudioStruct) updateFn,
  ) {
    _downloadingTracks[_index] = updateFn(_downloadingTracks[_index]);
  }

  void insertAtIndexInDownloadingTracks(
      int _index, MeditationAudioStruct _value) {
    _downloadingTracks.insert(_index, _value);
  }

  List<MeditationAudioStruct> _downloadedTracks = [];
  List<MeditationAudioStruct> get downloadedTracks => _downloadedTracks;
  set downloadedTracks(List<MeditationAudioStruct> _value) {
    _downloadedTracks = _value;
    prefs.setStringList(
        'ff_downloadedTracks', _value.map((x) => x.serialize()).toList());
  }

  void addToDownloadedTracks(MeditationAudioStruct _value) {
    _downloadedTracks.add(_value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void removeFromDownloadedTracks(MeditationAudioStruct _value) {
    _downloadedTracks.remove(_value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDownloadedTracks(int _index) {
    _downloadedTracks.removeAt(_index);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void updateDownloadedTracksAtIndex(
    int _index,
    MeditationAudioStruct Function(MeditationAudioStruct) updateFn,
  ) {
    _downloadedTracks[_index] = updateFn(_downloadedTracks[_index]);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDownloadedTracks(
      int _index, MeditationAudioStruct _value) {
    _downloadedTracks.insert(_index, _value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  List<DocumentReference> _searchHistory = [];
  List<DocumentReference> get searchHistory => _searchHistory;
  set searchHistory(List<DocumentReference> _value) {
    _searchHistory = _value;
    prefs.setStringList('ff_searchHistory', _value.map((x) => x.path).toList());
  }

  void addToSearchHistory(DocumentReference _value) {
    _searchHistory.add(_value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeFromSearchHistory(DocumentReference _value) {
    _searchHistory.remove(_value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeAtIndexFromSearchHistory(int _index) {
    _searchHistory.removeAt(_index);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void updateSearchHistoryAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _searchHistory[_index] = updateFn(_searchHistory[_index]);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void insertAtIndexInSearchHistory(int _index, DocumentReference _value) {
    _searchHistory.insert(_index, _value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  bool _repeatMode = false;
  bool get repeatMode => _repeatMode;
  set repeatMode(bool _value) {
    _repeatMode = _value;
  }

  String _currentTrackId = '';
  String get currentTrackId => _currentTrackId;
  set currentTrackId(String _value) {
    _currentTrackId = _value;
  }

  bool _isOffline = false;
  bool get isOffline => _isOffline;
  set isOffline(bool _value) {
    _isOffline = _value;
  }

  MeditationAudioStruct _currentOfflineSong = MeditationAudioStruct();
  MeditationAudioStruct get currentOfflineSong => _currentOfflineSong;
  set currentOfflineSong(MeditationAudioStruct _value) {
    _currentOfflineSong = _value;
  }

  void updateCurrentOfflineSongStruct(
      Function(MeditationAudioStruct) updateFn) {
    updateFn(_currentOfflineSong);
  }

  bool _isAppLoaded = false;
  bool get isAppLoaded => _isAppLoaded;
  set isAppLoaded(bool _value) {
    _isAppLoaded = _value;
  }

  bool _enLang = false;
  bool get enLang => _enLang;
  set enLang(bool _value) {
    _enLang = _value;
    prefs.setBool('ff_enLang', _value);
  }

  bool _ruLang = false;
  bool get ruLang => _ruLang;
  set ruLang(bool _value) {
    _ruLang = _value;
    prefs.setBool('ff_ruLang', _value);
  }

  String _LastAffirmationDate = '';
  String get LastAffirmationDate => _LastAffirmationDate;
  set LastAffirmationDate(String _value) {
    _LastAffirmationDate = _value;
    prefs.setString('ff_LastAffirmationDate', _value);
  }

  int _playerIndex = 0;
  int get playerIndex => _playerIndex;
  set playerIndex(int _value) {
    _playerIndex = _value;
  }

  final _meditationCategoryPageManager =
      StreamRequestManager<List<MeditationsRecord>>();
  Stream<List<MeditationsRecord>> meditationCategoryPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MeditationsRecord>> Function() requestFn,
  }) =>
      _meditationCategoryPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMeditationCategoryPageCache() =>
      _meditationCategoryPageManager.clear();
  void clearMeditationCategoryPageCacheKey(String? uniqueKey) =>
      _meditationCategoryPageManager.clearRequest(uniqueKey);

  final _buyPackCacheManager = StreamRequestManager<List<MeditationsRecord>>();
  Stream<List<MeditationsRecord>> buyPackCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MeditationsRecord>> Function() requestFn,
  }) =>
      _buyPackCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBuyPackCacheCache() => _buyPackCacheManager.clear();
  void clearBuyPackCacheCacheKey(String? uniqueKey) =>
      _buyPackCacheManager.clearRequest(uniqueKey);

  final _historyCacheManager = StreamRequestManager<MeditationsRecord>();
  Stream<MeditationsRecord> historyCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<MeditationsRecord> Function() requestFn,
  }) =>
      _historyCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHistoryCacheCache() => _historyCacheManager.clear();
  void clearHistoryCacheCacheKey(String? uniqueKey) =>
      _historyCacheManager.clearRequest(uniqueKey);

  final _listViewCacheManager =
      StreamRequestManager<List<MeditationCategoriesRecord>>();
  Stream<List<MeditationCategoriesRecord>> listViewCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MeditationCategoriesRecord>> Function() requestFn,
  }) =>
      _listViewCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListViewCacheCache() => _listViewCacheManager.clear();
  void clearListViewCacheCacheKey(String? uniqueKey) =>
      _listViewCacheManager.clearRequest(uniqueKey);

  final _demoCacheManager =
      StreamRequestManager<List<MeditationCategoriesRecord>>();
  Stream<List<MeditationCategoriesRecord>> demoCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MeditationCategoriesRecord>> Function() requestFn,
  }) =>
      _demoCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDemoCacheCache() => _demoCacheManager.clear();
  void clearDemoCacheCacheKey(String? uniqueKey) =>
      _demoCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
