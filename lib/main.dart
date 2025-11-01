import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();
  await FlutterFlowTheme.initialize();

  final appState = FFAppState();
  await appState.initializePersistedState();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appState),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  late Stream<BaseAuthUser> userStream;

  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();

    @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = mIDKysymyksetToimiiFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(const Duration(milliseconds: 1000),
        () => _appStateNotifier.stopShowingSplashImage());

    // Esiladataan kaikki introsivujen taustakuvat muistiin
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        // Etsitään konteksti turvallisesti — ilman navigatorKeytä
final bindingContext = WidgetsBinding.instance.renderViewElement;
if (bindingContext != null) {
  for (final path in [
    'assets/images/pexels-yaroslav-shuraev-5085568.png',
    'assets/images/majorca-4009529_1280.png',
    'assets/images/danger-bridge-178132_1280.png',
    'assets/images/heart-6981429_1280.png',
    'assets/images/rainy-days-9620151_1280.png',
  ]) {
    precacheImage(AssetImage(path), bindingContext);
  }
}

      } catch (e) {
        debugPrint('Kuvien esilataus epäonnistui: $e');
      }
    });
  }

  void setLocale(String language) =>
      safeSetState(() => _locale = createLocale(language));

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    // 1) jos router tai app-state ei ole vielä valmiina → näytä lataus
    if (_router == null || _appStateNotifier == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    // 2) mobiili vs. iso näyttö
    final mediaQuery = MediaQuery.maybeOf(context);
    final width = mediaQuery?.size.width ?? 400;

    // jos iso näyttö → näytä tämä
    if (mediaQuery != null && width > 600) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Tämä sovellus toimii vain mobiililaitteilla 📱',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      );
    }

        // 3) normaali mobiili-appi (TÄMÄ on se, mikä sulla oli alun perin)
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MID Wellbeing',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('fi'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}





