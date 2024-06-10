import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
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
  set lastDateShowAffirmation(DateTime? value) {
    _lastDateShowAffirmation = value;
    value != null
        ? prefs.setInt(
            'ff_lastDateShowAffirmation', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastDateShowAffirmation');
  }

  DocumentReference? _lastShowAffirmation;
  DocumentReference? get lastShowAffirmation => _lastShowAffirmation;
  set lastShowAffirmation(DocumentReference? value) {
    _lastShowAffirmation = value;
    value != null
        ? prefs.setString('ff_lastShowAffirmation', value.path)
        : prefs.remove('ff_lastShowAffirmation');
  }

  DocumentReference? _currentStory;
  DocumentReference? get currentStory => _currentStory;
  set currentStory(DocumentReference? value) {
    _currentStory = value;
    value != null
        ? prefs.setString('ff_currentStory', value.path)
        : prefs.remove('ff_currentStory');
  }

  String _imageProfileBlurHash = '';
  String get imageProfileBlurHash => _imageProfileBlurHash;
  set imageProfileBlurHash(String value) {
    _imageProfileBlurHash = value;
    prefs.setString('ff_imageProfileBlurHash', value);
  }

  bool _isAudioPlaying = false;
  bool get isAudioPlaying => _isAudioPlaying;
  set isAudioPlaying(bool value) {
    _isAudioPlaying = value;
    prefs.setBool('ff_isAudioPlaying', value);
  }

  int _positionMS = 0;
  int get positionMS => _positionMS;
  set positionMS(int value) {
    _positionMS = value;
  }

  int _durationMS = 0;
  int get durationMS => _durationMS;
  set durationMS(int value) {
    _durationMS = value;
  }

  List<MeditationAudioStruct> _downloadingTracks = [];
  List<MeditationAudioStruct> get downloadingTracks => _downloadingTracks;
  set downloadingTracks(List<MeditationAudioStruct> value) {
    _downloadingTracks = value;
  }

  void addToDownloadingTracks(MeditationAudioStruct value) {
    _downloadingTracks.add(value);
  }

  void removeFromDownloadingTracks(MeditationAudioStruct value) {
    _downloadingTracks.remove(value);
  }

  void removeAtIndexFromDownloadingTracks(int index) {
    _downloadingTracks.removeAt(index);
  }

  void updateDownloadingTracksAtIndex(
    int index,
    MeditationAudioStruct Function(MeditationAudioStruct) updateFn,
  ) {
    _downloadingTracks[index] = updateFn(_downloadingTracks[index]);
  }

  void insertAtIndexInDownloadingTracks(
      int index, MeditationAudioStruct value) {
    _downloadingTracks.insert(index, value);
  }

  List<MeditationAudioStruct> _downloadedTracks = [];
  List<MeditationAudioStruct> get downloadedTracks => _downloadedTracks;
  set downloadedTracks(List<MeditationAudioStruct> value) {
    _downloadedTracks = value;
    prefs.setStringList(
        'ff_downloadedTracks', value.map((x) => x.serialize()).toList());
  }

  void addToDownloadedTracks(MeditationAudioStruct value) {
    _downloadedTracks.add(value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void removeFromDownloadedTracks(MeditationAudioStruct value) {
    _downloadedTracks.remove(value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDownloadedTracks(int index) {
    _downloadedTracks.removeAt(index);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void updateDownloadedTracksAtIndex(
    int index,
    MeditationAudioStruct Function(MeditationAudioStruct) updateFn,
  ) {
    _downloadedTracks[index] = updateFn(_downloadedTracks[index]);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDownloadedTracks(
      int index, MeditationAudioStruct value) {
    _downloadedTracks.insert(index, value);
    prefs.setStringList('ff_downloadedTracks',
        _downloadedTracks.map((x) => x.serialize()).toList());
  }

  List<DocumentReference> _searchHistory = [];
  List<DocumentReference> get searchHistory => _searchHistory;
  set searchHistory(List<DocumentReference> value) {
    _searchHistory = value;
    prefs.setStringList('ff_searchHistory', value.map((x) => x.path).toList());
  }

  void addToSearchHistory(DocumentReference value) {
    _searchHistory.add(value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeFromSearchHistory(DocumentReference value) {
    _searchHistory.remove(value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeAtIndexFromSearchHistory(int index) {
    _searchHistory.removeAt(index);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void updateSearchHistoryAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _searchHistory[index] = updateFn(_searchHistory[index]);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void insertAtIndexInSearchHistory(int index, DocumentReference value) {
    _searchHistory.insert(index, value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  bool _repeatMode = false;
  bool get repeatMode => _repeatMode;
  set repeatMode(bool value) {
    _repeatMode = value;
  }

  String _currentTrackId = '';
  String get currentTrackId => _currentTrackId;
  set currentTrackId(String value) {
    _currentTrackId = value;
  }

  bool _isOffline = false;
  bool get isOffline => _isOffline;
  set isOffline(bool value) {
    _isOffline = value;
  }

  MeditationAudioStruct _currentOfflineSong = MeditationAudioStruct();
  MeditationAudioStruct get currentOfflineSong => _currentOfflineSong;
  set currentOfflineSong(MeditationAudioStruct value) {
    _currentOfflineSong = value;
  }

  void updateCurrentOfflineSongStruct(
      Function(MeditationAudioStruct) updateFn) {
    updateFn(_currentOfflineSong);
  }

  bool _isAppLoaded = false;
  bool get isAppLoaded => _isAppLoaded;
  set isAppLoaded(bool value) {
    _isAppLoaded = value;
  }

  bool _enLang = false;
  bool get enLang => _enLang;
  set enLang(bool value) {
    _enLang = value;
    prefs.setBool('ff_enLang', value);
  }

  bool _ruLang = false;
  bool get ruLang => _ruLang;
  set ruLang(bool value) {
    _ruLang = value;
    prefs.setBool('ff_ruLang', value);
  }

  String _LastAffirmationDate = '';
  String get LastAffirmationDate => _LastAffirmationDate;
  set LastAffirmationDate(String value) {
    _LastAffirmationDate = value;
    prefs.setString('ff_LastAffirmationDate', value);
  }

  int _playerIndex = 0;
  int get playerIndex => _playerIndex;
  set playerIndex(int value) {
    _playerIndex = value;
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
