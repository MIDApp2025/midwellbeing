import '/backend/api_requests/api_calls.dart';
import '/components/coaching_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_reflectionss_model.dart';
export 'page_reflectionss_model.dart';

/// Create a “Coaching Program” page for a wellbeing app.
///
/// The page should display a carousel of 5 cards, one for each day of a
/// personal growth program.
///
/// Each card should include:
/// – A small title (e.g. “Day 1 – Stop for a moment”)
/// – A short reflection text (2–4 sentences)
/// – A calm background color, rounded corners, and centered layout
/// – A small emoji or icon (like 🌱 or ✨) at the top of each card
///
/// Below the carousel, show small dot indicators to represent the current
/// day.
/// Add a final 6th card that says “You’ve completed your week 🌿” with a
/// short thank-you message.
///
/// Keep the main page layout simple and clean:
/// – Header: “5-Day Coaching Program”
/// – Subtitle: “Swipe through your daily reflections”
/// – Carousel with 5–6 cards in the middle
/// – A “Back to Menu” button at the bottom.
///
/// The design style should be calm, minimalistic, and mobile-friendly, with
/// soft colors and smooth transitions.
class PageReflectionssWidget extends StatefulWidget {
  const PageReflectionssWidget({super.key});

  static String routeName = 'pageReflectionss';
  static String routePath = '/pageReflections';

  @override
  State<PageReflectionssWidget> createState() => _PageReflectionssWidgetState();
}

class _PageReflectionssWidgetState extends State<PageReflectionssWidget> {
  late PageReflectionssModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageReflectionssModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent3,
        appBar: AppBar(
          backgroundColor: Color(0x0094B5D8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(MaikkiWidget.routeName);
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              'fubw35m4' /* MID  */,
            ),
            minFontSize: 16.0,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.more_vert,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(SettingsageWidget.routeName);
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rsvq0hlv' /* Daily Reflections ☘️ */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 22.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 22.0;
                                    } else {
                                      return 24.0;
                                    }
                                  }(),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'c5t4e1ch' /* A Moment for You. Click card. */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF718096),
                                  fontSize: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 15.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 17.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 20.0;
                                    } else {
                                      return 20.0;
                                    }
                                  }(),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: GetDailyExercisesCoachCall.call(
                                    language: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final carouselGetDailyExercisesCoachResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final karuselli =
                                            carouselGetDailyExercisesCoachResponse
                                                .jsonBody
                                                .toList();

                                        return Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: CarouselSlider.builder(
                                            itemCount: karuselli.length,
                                            itemBuilder:
                                                (context, karuselliIndex, _) {
                                              final karuselliItem =
                                                  karuselli[karuselliIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.widgetId =
                                                            getJsonField(
                                                          karuselliItem,
                                                          r'''$.id''',
                                                        ).toString();
                                                        safeSetState(() {});
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CoachingWidget(
                                                                  id: _model
                                                                      .widgetId,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.47,
                                                        child: custom_widgets
                                                            .ExerciseCard(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.47,
                                                          emoji: getJsonField(
                                                            karuselliItem,
                                                            r'''$.emoji''',
                                                          ).toString(),
                                                          titleFi: getJsonField(
                                                            karuselliItem,
                                                            r'''$.titleFi''',
                                                          ).toString(),
                                                          textFi: getJsonField(
                                                            karuselliItem,
                                                            r'''$.textFi''',
                                                          ).toString(),
                                                          currentIndex:
                                                              karuselliIndex,
                                                          visibleDots: 7,
                                                          currentLanguageCode:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                          id: getJsonField(
                                                            karuselliItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          titleEn: getJsonField(
                                                            karuselliItem,
                                                            r'''$.titleEn''',
                                                          ).toString(),
                                                          textEn: getJsonField(
                                                            karuselliItem,
                                                            r'''$.textEn''',
                                                          ).toString(),
                                                          onCardTapped:
                                                              (id) async {
                                                            _model.apiOntapWiget =
                                                                await GetSingleProgramCoachCall
                                                                    .call(
                                                              id: id,
                                                              language: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            );

                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    300,
                                                              ),
                                                            );
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        CoachingWidget(
                                                                      emoji:
                                                                          getJsonField(
                                                                        (_model.apiOntapWiget?.jsonBody ??
                                                                            ''),
                                                                        r'''$.emoji''',
                                                                      ).toString(),
                                                                      title:
                                                                          getJsonField(
                                                                        (_model.apiOntapWiget?.jsonBody ??
                                                                            ''),
                                                                        r'''$.title''',
                                                                      ).toString(),
                                                                      content:
                                                                          getJsonField(
                                                                        (_model.apiOntapWiget?.jsonBody ??
                                                                            ''),
                                                                        r'''$.content''',
                                                                      ).toString(),
                                                                      id: id,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                            carouselController:
                                                _model.carouselController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(0,
                                                  min(0, karuselli.length - 1)),
                                              viewportFraction: 0.95,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.2,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: false,
                                              onPageChanged: (index, _) async {
                                                _model.carouselCurrentIndex =
                                                    index;
                                                _model.currentIndex =
                                                    _model.carouselCurrentIndex;
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 0) ||
                                (_model.carouselCurrentIndex == 7) ||
                                (_model.carouselCurrentIndex == 14)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 1) ||
                                (_model.carouselCurrentIndex == 8) ||
                                (_model.carouselCurrentIndex == 15)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 2) ||
                                (_model.carouselCurrentIndex == 9) ||
                                (_model.carouselCurrentIndex == 16)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 3) ||
                                (_model.carouselCurrentIndex == 10) ||
                                (_model.carouselCurrentIndex == 17)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 4) ||
                                (_model.carouselCurrentIndex == 11) ||
                                (_model.carouselCurrentIndex == 18)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 5) ||
                                (_model.carouselCurrentIndex == 12) ||
                                (_model.carouselCurrentIndex == 19)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: (_model.carouselCurrentIndex == 6) ||
                                (_model.carouselCurrentIndex == 13)
                            ? FlutterFlowTheme.of(context).customColor5
                            : Color(0xFFCBD5E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'b1cywm76' /* Back to Menu */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Color(0xFFE2E8F0),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 32.0))
                  .addToStart(SizedBox(height: 24.0))
                  .addToEnd(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
