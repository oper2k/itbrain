import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child:
            appStateNotifier.loggedIn ? const HomePageWidget() : const OnBoardingWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'onBoarding',
          path: '/onBoarding',
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'DebugPage',
          path: '/debugPage',
          asyncParams: {
            'meditaionsList':
                getDocList(['meditations'], MeditationsRecord.fromSnapshot),
          },
          builder: (context, params) => DebugPageWidget(
            meditaionsList: params.getParam<MeditationsRecord>(
              'meditaionsList',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'signUpPage',
          path: '/signUpPage',
          builder: (context, params) => SignUpPageWidget(
            pageParameter: params.getParam(
              'pageParameter',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'signInPage',
          path: '/signInPage',
          builder: (context, params) => const SignInPageWidget(),
        ),
        FFRoute(
          name: 'forgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'profileCabinet',
          path: '/profileCabinet',
          builder: (context, params) => const ProfileCabinetWidget(),
        ),
        FFRoute(
          name: 'aboutPage',
          path: '/aboutPage',
          builder: (context, params) => const AboutPageWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'Affirmation',
          path: '/affirmation',
          asyncParams: {
            'currentAffirmation':
                getDoc(['affirmation'], AffirmationRecord.fromSnapshot),
          },
          builder: (context, params) => AffirmationWidget(
            currentAffirmation: params.getParam(
              'currentAffirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Stories',
          path: '/stories',
          asyncParams: {
            'stories': getDocList(['stories'], StoriesRecord.fromSnapshot),
          },
          builder: (context, params) => StoriesWidget(
            stories: params.getParam<StoriesRecord>(
              'stories',
              ParamType.Document,
              isList: true,
            ),
            index: params.getParam(
              'index',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'buyPack',
          path: '/buyPack',
          asyncParams: {
            'meditationCategory': getDoc(['meditationCategories'],
                MeditationCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => BuyPackWidget(
            meditationCategory: params.getParam(
              'meditationCategory',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'paymentMethod',
          path: '/paymentMethod',
          asyncParams: {
            'category': getDoc(['meditationCategories'],
                MeditationCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => PaymentMethodWidget(
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'cardDetails',
          path: '/cardDetails',
          builder: (context, params) => const CardDetailsWidget(),
        ),
        FFRoute(
          name: 'playerPage',
          path: '/playerPage',
          asyncParams: {
            'audio':
                getDocList(['meditations'], MeditationsRecord.fromSnapshot),
            'meditation': getDoc(['meditationCategories'],
                MeditationCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => PlayerPageWidget(
            audio: params.getParam<MeditationsRecord>(
              'audio',
              ParamType.Document,
              isList: true,
            ),
            medCategory: params.getParam(
              'medCategory',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['meditationCategories'],
            ),
            meditation: params.getParam(
              'meditation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'changeLanguage',
          path: '/changeLanguage',
          builder: (context, params) => const ChangeLanguageWidget(),
        ),
        FFRoute(
          name: 'offlinePlayerPage',
          path: '/offlinePlayerPage',
          builder: (context, params) => OfflinePlayerPageWidget(
            currentAudioIndex: params.getParam(
              'currentAudioIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'paymentPage',
          path: '/paymentPage',
          builder: (context, params) => const PaymentPageWidget(),
        ),
        FFRoute(
          name: 'testQueryCache',
          path: '/testQueryCache',
          builder: (context, params) => const TestQueryCacheWidget(),
        ),
        FFRoute(
          name: 'confirmEmail',
          path: '/confirmEmail',
          builder: (context, params) => const ConfirmEmailWidget(),
        ),
        FFRoute(
          name: 'confirmEmailProfile',
          path: '/confirmEmailProfile',
          builder: (context, params) => const ConfirmEmailProfileWidget(),
        ),
        FFRoute(
          name: 'meditationInfo',
          path: '/meditationInfo',
          asyncParams: {
            'meditationCategory': getDoc(['meditationCategories'],
                MeditationCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => MeditationInfoWidget(
            meditationCategory: params.getParam(
              'meditationCategory',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'searchPageNew',
          path: '/searchPageNew',
          builder: (context, params) => const SearchPageNewWidget(),
        ),
        FFRoute(
          name: 'studyPage',
          path: '/studyPage',
          builder: (context, params) => const StudyPageWidget(),
        ),
        FFRoute(
          name: 'studyInfoPage',
          path: '/studyInfoPage',
          asyncParams: {
            'courseInfo':
                getDoc(['studyCategories'], StudyCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => StudyInfoPageWidget(
            courseInfo: params.getParam(
              'courseInfo',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'studyLevels',
          path: '/studyLevels',
          asyncParams: {
            'course':
                getDoc(['studyCategories'], StudyCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => StudyLevelsWidget(
            course: params.getParam(
              'course',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'studyLevelInfo',
          path: '/studyLevelInfo',
          asyncParams: {
            'study':
                getDoc(['studyCategories'], StudyCategoriesRecord.fromSnapshot),
            'levels': getDoc(['levels'], LevelsRecord.fromSnapshot),
          },
          builder: (context, params) => StudyLevelInfoWidget(
            study: params.getParam(
              'study',
              ParamType.Document,
            ),
            levels: params.getParam(
              'levels',
              ParamType.Document,
            ),
            currentLevelndex: params.getParam(
              'currentLevelndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'contentPage',
          path: '/contentPage',
          asyncParams: {
            'lesson': getDoc(['lessons'], LessonsRecord.fromSnapshot),
          },
          builder: (context, params) => ContentPageWidget(
            lesson: params.getParam(
              'lesson',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'bookPageInfo',
          path: '/bookPageInfo',
          asyncParams: {
            'pageInfo': getDoc(['booksPages'], BooksPagesRecord.fromSnapshot),
          },
          builder: (context, params) => BookPageInfoWidget(
            pageInfo: params.getParam(
              'pageInfo',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'allVideos',
          path: '/allVideos',
          builder: (context, params) => const AllVideosWidget(),
        ),
        FFRoute(
          name: 'lessonsAllCodes',
          path: '/lessonsAllCodes',
          asyncParams: {
            'courseInfo':
                getDoc(['studyCategories'], StudyCategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => LessonsAllCodesWidget(
            courseInfo: params.getParam(
              'courseInfo',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onBoarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).thirdBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/2024-05-22_15.21.07.jpg',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
