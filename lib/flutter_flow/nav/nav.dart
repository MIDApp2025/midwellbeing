import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:custom_calendar_library_169y2c/index.dart'
    as $custom_calendar_library_169y2c;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $custom_calendar_library_169y2c.initializeRoutes(
    homePageWidgetName: 'custom_calendar_library_169y2c.HomePage',
    homePageWidgetPath: '/homePage',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? GettingStartedWidget() : LogInWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? GettingStartedWidget() : LogInWidget(),
      ),
      FFRoute(
        name: LogInWidget.routeName,
        path: LogInWidget.routePath,
        builder: (context, params) => LogInWidget(),
      ),
      FFRoute(
        name: MygrowthWidget.routeName,
        path: MygrowthWidget.routePath,
        builder: (context, params) => MygrowthWidget(),
      ),
      FFRoute(
        name: MoodTestWidget.routeName,
        path: MoodTestWidget.routePath,
        builder: (context, params) => MoodTestWidget(),
      ),
      FFRoute(
        name: ConfidenceTestWidget.routeName,
        path: ConfidenceTestWidget.routePath,
        builder: (context, params) => ConfidenceTestWidget(),
      ),
      FFRoute(
        name: StrengthTestWidget.routeName,
        path: StrengthTestWidget.routePath,
        builder: (context, params) => StrengthTestWidget(),
      ),
      FFRoute(
        name: BelongingTestWidget.routeName,
        path: BelongingTestWidget.routePath,
        builder: (context, params) => BelongingTestWidget(),
      ),
      FFRoute(
        name: GettingStartedWidget.routeName,
        path: GettingStartedWidget.routePath,
        requireAuth: true,
        builder: (context, params) => GettingStartedWidget(),
      ),
      FFRoute(
        name: ConfidenceGraphWidget.routeName,
        path: ConfidenceGraphWidget.routePath,
        builder: (context, params) => ConfidenceGraphWidget(),
      ),
      FFRoute(
        name: BelongingGraphWidget.routeName,
        path: BelongingGraphWidget.routePath,
        builder: (context, params) => BelongingGraphWidget(),
      ),
      FFRoute(
        name: InsightsWidget.routeName,
        path: InsightsWidget.routePath,
        builder: (context, params) => InsightsWidget(
          userTimezone: params.getParam(
            'userTimezone',
            ParamType.String,
          ),
          updatedAt: params.getParam(
            'updatedAt',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: StrengtGraphWidget.routeName,
        path: StrengtGraphWidget.routePath,
        builder: (context, params) => StrengtGraphWidget(),
      ),
      FFRoute(
        name: ConfidenceTestPageWidget.routeName,
        path: ConfidenceTestPageWidget.routePath,
        builder: (context, params) => ConfidenceTestPageWidget(
          testID: params.getParam(
            'testID',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: IntroForTestWidget.routeName,
        path: IntroForTestWidget.routePath,
        builder: (context, params) => IntroForTestWidget(),
      ),
      FFRoute(
        name: MaikkiWidget.routeName,
        path: MaikkiWidget.routePath,
        builder: (context, params) => MaikkiWidget(),
      ),
      FFRoute(
        name: IntroForMyGrowthWidget.routeName,
        path: IntroForMyGrowthWidget.routePath,
        builder: (context, params) => IntroForMyGrowthWidget(),
      ),
      FFRoute(
        name: ForgotPassword02Widget.routeName,
        path: ForgotPassword02Widget.routePath,
        builder: (context, params) => ForgotPassword02Widget(),
      ),
      FFRoute(
        name: OivallusKokoViestiWidget.routeName,
        path: OivallusKokoViestiWidget.routePath,
        builder: (context, params) => OivallusKokoViestiWidget(
          messageContent: params.getParam(
            'messageContent',
            ParamType.String,
          ),
          formattedDateTime: params.getParam(
            'formattedDateTime',
            ParamType.String,
          ),
          itemOivalluksetItem: params.getParam(
            'itemOivalluksetItem',
            ParamType.JSON,
          ),
        ),
      ),
      FFRoute(
        name: KontekstiMoodWidget.routeName,
        path: KontekstiMoodWidget.routePath,
        builder: (context, params) => KontekstiMoodWidget(),
      ),
      FFRoute(
        name: KontekstibelongingWidget.routeName,
        path: KontekstibelongingWidget.routePath,
        builder: (context, params) => KontekstibelongingWidget(),
      ),
      FFRoute(
        name: KontekstiStrengthWidget.routeName,
        path: KontekstiStrengthWidget.routePath,
        builder: (context, params) => KontekstiStrengthWidget(),
      ),
      FFRoute(
        name: MonthlyHistoryWidget.routeName,
        path: MonthlyHistoryWidget.routePath,
        builder: (context, params) => MonthlyHistoryWidget(),
      ),
      FFRoute(
        name: WeeklyReportsWidget.routeName,
        path: WeeklyReportsWidget.routePath,
        builder: (context, params) => WeeklyReportsWidget(),
      ),
      FFRoute(
        name: WeeklyHistoryListsWidget.routeName,
        path: WeeklyHistoryListsWidget.routePath,
        builder: (context, params) => WeeklyHistoryListsWidget(
          docId: params.getParam(
            'docId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: WeeklyKokoViestiWidget.routeName,
        path: WeeklyKokoViestiWidget.routePath,
        builder: (context, params) => WeeklyKokoViestiWidget(
          label: params.getParam(
            'label',
            ParamType.String,
          ),
          aiSummary: params.getParam(
            'aiSummary',
            ParamType.String,
          ),
          mood: params.getParam(
            'mood',
            ParamType.String,
          ),
          confidence: params.getParam(
            'confidence',
            ParamType.String,
          ),
          strength: params.getParam(
            'strength',
            ParamType.String,
          ),
          belonging: params.getParam(
            'belonging',
            ParamType.String,
          ),
          pUserId: params.getParam(
            'pUserId',
            ParamType.String,
          ),
          docId: params.getParam(
            'docId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: MonthlyHistoryListsWidget.routeName,
        path: MonthlyHistoryListsWidget.routePath,
        builder: (context, params) => MonthlyHistoryListsWidget(
          monthlySummary: params.getParam(
            'monthlySummary',
            ParamType.String,
          ),
          docId: params.getParam(
            'docId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: MonthlyKokoViestiWidget.routeName,
        path: MonthlyKokoViestiWidget.routePath,
        builder: (context, params) => MonthlyKokoViestiWidget(
          mood: params.getParam(
            'mood',
            ParamType.String,
          ),
          strength: params.getParam(
            'strength',
            ParamType.String,
          ),
          belonging: params.getParam(
            'belonging',
            ParamType.String,
          ),
          month: params.getParam(
            'month',
            ParamType.String,
          ),
          aiSummary: params.getParam(
            'aiSummary',
            ParamType.String,
          ),
          confidence: params.getParam(
            'confidence',
            ParamType.String,
          ),
          pUserId: params.getParam(
            'pUserId',
            ParamType.String,
          ),
          pYear: params.getParam(
            'pYear',
            ParamType.int,
          ),
          pMonth: params.getParam(
            'pMonth',
            ParamType.int,
          ),
          pLang: params.getParam(
            'pLang',
            ParamType.String,
          ),
          docId: params.getParam(
            'docId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: MIDChatAICopyWidget.routeName,
        path: MIDChatAICopyWidget.routePath,
        builder: (context, params) => MIDChatAICopyWidget(
          fromHistory: params.getParam(
            'fromHistory',
            ParamType.bool,
          ),
        ),
      ),
      FFRoute(
        name: SavedTest1Widget.routeName,
        path: SavedTest1Widget.routePath,
        builder: (context, params) => SavedTest1Widget(),
      ),
      FFRoute(
        name: MoodGrapNewWidget.routeName,
        path: MoodGrapNewWidget.routePath,
        builder: (context, params) => MoodGrapNewWidget(),
      ),
      FFRoute(
        name: IntroForchat1Widget.routeName,
        path: IntroForchat1Widget.routePath,
        builder: (context, params) => IntroForchat1Widget(),
      ),
      FFRoute(
        name: IntroForTapping1Widget.routeName,
        path: IntroForTapping1Widget.routePath,
        builder: (context, params) => IntroForTapping1Widget(),
      ),
      FFRoute(
        name: IntroForchatInsightsWidget.routeName,
        path: IntroForchatInsightsWidget.routePath,
        builder: (context, params) => IntroForchatInsightsWidget(),
      ),
      FFRoute(
        name: KontekstiConfidenceNewWidget.routeName,
        path: KontekstiConfidenceNewWidget.routePath,
        builder: (context, params) => KontekstiConfidenceNewWidget(),
      ),
      FFRoute(
        name: CreateAccountWidget.routeName,
        path: CreateAccountWidget.routePath,
        builder: (context, params) => CreateAccountWidget(),
      ),
      FFRoute(
        name: SignInEmailWidget.routeName,
        path: SignInEmailWidget.routePath,
        builder: (context, params) => SignInEmailWidget(),
      ),
      FFRoute(
        name: SettingsageWidget.routeName,
        path: SettingsageWidget.routePath,
        builder: (context, params) => SettingsageWidget(),
      ),
      FFRoute(
        name: EditProfileWidget.routeName,
        path: EditProfileWidget.routePath,
        builder: (context, params) => EditProfileWidget(
          currentPhoto: params.getParam(
            'currentPhoto',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ViewprofileWidget.routeName,
        path: ViewprofileWidget.routePath,
        builder: (context, params) => ViewprofileWidget(
          name: params.getParam(
            'name',
            ParamType.String,
          ),
          country: params.getParam(
            'country',
            ParamType.String,
          ),
          city: params.getParam(
            'city',
            ParamType.String,
          ),
          bio: params.getParam(
            'bio',
            ParamType.String,
          ),
          email: params.getParam(
            'email',
            ParamType.String,
          ),
          photoUrl: params.getParam(
            'photoUrl',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HowItWorksWidget.routeName,
        path: HowItWorksWidget.routePath,
        builder: (context, params) => HowItWorksWidget(),
      ),
      FFRoute(
        name: NotesKokoViestiWidget.routeName,
        path: NotesKokoViestiWidget.routePath,
        builder: (context, params) => NotesKokoViestiWidget(
          date: params.getParam(
            'date',
            ParamType.String,
          ),
          message: params.getParam(
            'message',
            ParamType.String,
          ),
          notesItem: params.getParam(
            'notesItem',
            ParamType.JSON,
          ),
          noteId: params.getParam(
            'noteId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageLittleWidget.routeName,
        path: PageLittleWidget.routePath,
        builder: (context, params) => PageLittleWidget(),
      ),
      FFRoute(
        name: PageReflectionssWidget.routeName,
        path: PageReflectionssWidget.routePath,
        builder: (context, params) => PageReflectionssWidget(),
      ),
      FFRoute(
        name: NotesKokoViestiCopyWidget.routeName,
        path: NotesKokoViestiCopyWidget.routePath,
        builder: (context, params) => NotesKokoViestiCopyWidget(
          date: params.getParam(
            'date',
            ParamType.String,
          ),
          message: params.getParam(
            'message',
            ParamType.String,
          ),
          notesItem: params.getParam(
            'notesItem',
            ParamType.JSON,
          ),
          noteId: params.getParam(
            'noteId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $custom_calendar_library_169y2c.HomePageWidget.routeName,
        path: $custom_calendar_library_169y2c.HomePageWidget.routePath,
        builder: (context, params) =>
            $custom_calendar_library_169y2c.HomePageWidget(),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

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
            return '/logIn';
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
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
