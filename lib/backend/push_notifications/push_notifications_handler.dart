import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).thirdBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Splash.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'onBoarding': ParameterData.none(),
  'DebugPage': (data) async => const ParameterData(
        allParams: {},
      ),
  'signUpPage': (data) async => ParameterData(
        allParams: {
          'pageParameter': getParameter<int>(data, 'pageParameter'),
        },
      ),
  'signInPage': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'profileCabinet': ParameterData.none(),
  'aboutPage': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'Affirmation': (data) async => ParameterData(
        allParams: {
          'currentAffirmation': await getDocumentParameter<AffirmationRecord>(
              data, 'currentAffirmation', AffirmationRecord.fromSnapshot),
        },
      ),
  'HomePage': ParameterData.none(),
  'Stories': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'buyPack': (data) async => ParameterData(
        allParams: {
          'meditationCategory':
              await getDocumentParameter<MeditationCategoriesRecord>(
                  data,
                  'meditationCategory',
                  MeditationCategoriesRecord.fromSnapshot),
        },
      ),
  'paymentMethod': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<MeditationCategoriesRecord>(
              data, 'category', MeditationCategoriesRecord.fromSnapshot),
        },
      ),
  'cardDetails': ParameterData.none(),
  'playerPage': (data) async => ParameterData(
        allParams: {
          'medCategory': getParameter<DocumentReference>(data, 'medCategory'),
          'meditation': await getDocumentParameter<MeditationCategoriesRecord>(
              data, 'meditation', MeditationCategoriesRecord.fromSnapshot),
        },
      ),
  'changeLanguage': ParameterData.none(),
  'offlinePlayerPage': (data) async => ParameterData(
        allParams: {
          'currentAudioIndex': getParameter<int>(data, 'currentAudioIndex'),
        },
      ),
  'paymentPage': ParameterData.none(),
  'testQueryCache': ParameterData.none(),
  'confirmEmail': ParameterData.none(),
  'confirmEmailProfile': ParameterData.none(),
  'meditationInfo': (data) async => ParameterData(
        allParams: {
          'meditationCategory':
              await getDocumentParameter<MeditationCategoriesRecord>(
                  data,
                  'meditationCategory',
                  MeditationCategoriesRecord.fromSnapshot),
        },
      ),
  'searchPageNew': ParameterData.none(),
  'studyPage': ParameterData.none(),
  'studyInfoPage': (data) async => ParameterData(
        allParams: {
          'courseInfo': await getDocumentParameter<StudyCategoriesRecord>(
              data, 'courseInfo', StudyCategoriesRecord.fromSnapshot),
        },
      ),
  'studyLevels': (data) async => ParameterData(
        allParams: {
          'course': await getDocumentParameter<StudyCategoriesRecord>(
              data, 'course', StudyCategoriesRecord.fromSnapshot),
        },
      ),
  'studyLevelInfo': (data) async => ParameterData(
        allParams: {
          'study': await getDocumentParameter<StudyCategoriesRecord>(
              data, 'study', StudyCategoriesRecord.fromSnapshot),
          'levels': await getDocumentParameter<LevelsRecord>(
              data, 'levels', LevelsRecord.fromSnapshot),
          'currentLevelndex': getParameter<int>(data, 'currentLevelndex'),
        },
      ),
  'contentPage': (data) async => ParameterData(
        allParams: {
          'lesson': await getDocumentParameter<LessonsRecord>(
              data, 'lesson', LessonsRecord.fromSnapshot),
          'isLastLesson': getParameter<bool>(data, 'isLastLesson'),
          'level': await getDocumentParameter<LevelsRecord>(
              data, 'level', LevelsRecord.fromSnapshot),
        },
      ),
  'bookPageInfo': (data) async => ParameterData(
        allParams: {
          'pageInfo': await getDocumentParameter<BooksPagesRecord>(
              data, 'pageInfo', BooksPagesRecord.fromSnapshot),
        },
      ),
  'allVideos': ParameterData.none(),
  'lessonsAllCodes': (data) async => ParameterData(
        allParams: {
          'courseInfo': await getDocumentParameter<StudyCategoriesRecord>(
              data, 'courseInfo', StudyCategoriesRecord.fromSnapshot),
        },
      ),
  'bookTimer': (data) async => ParameterData(
        allParams: {
          'book': await getDocumentParameter<BookInfoRecord>(
              data, 'book', BookInfoRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
