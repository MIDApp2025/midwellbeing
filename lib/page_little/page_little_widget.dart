import '/backend/api_requests/api_calls.dart';
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
import 'page_little_model.dart';
export 'page_little_model.dart';

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
class PageLittleWidget extends StatefulWidget {
  const PageLittleWidget({super.key});

  static String routeName = 'pageLittle';
  static String routePath = '/pageLittle';

  @override
  State<PageLittleWidget> createState() => _PageLittleWidgetState();
}

class _PageLittleWidgetState extends State<PageLittleWidget> {
  late PageLittleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageLittleModel());

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
              'zugyct04' /* MID  */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0gi4uydq' /* A Little Act 💫 */,
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
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 22.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 24.0;
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
                            'gu9l9q5f' /* Thoughts for Today */,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 15.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 17.0;
                                  } else if (MediaQuery.sizeOf(context).width <
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
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: DailyCoachCall.call(
                                  lang:
                                      FFLocalizations.of(context).languageCode,
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
                                  final carouselDailyCoachResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final karuselliUusi =
                                          carouselDailyCoachResponse.jsonBody
                                              .toList();

                                      return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.45,
                                        child: CarouselSlider.builder(
                                          itemCount: karuselliUusi.length,
                                          itemBuilder:
                                              (context, karuselliUusiIndex, _) {
                                            final karuselliUusiItem =
                                                karuselliUusi[
                                                    karuselliUusiIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.45,
                                                  child: custom_widgets
                                                      .ExerciseCard(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.45,
                                                    emoji: getJsonField(
                                                      karuselliUusiItem,
                                                      r'''$.emoji''',
                                                    ).toString(),
                                                    titleFi: getJsonField(
                                                      karuselliUusiItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    textFi: getJsonField(
                                                      karuselliUusiItem,
                                                      r'''$.text''',
                                                    ).toString(),
                                                    currentIndex:
                                                        karuselliUusiIndex,
                                                    visibleDots: 7,
                                                    currentLanguageCode:
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                    id: '',
                                                    titleEn: getJsonField(
                                                      karuselliUusiItem,
                                                      r'''$.titleEn''',
                                                    ).toString(),
                                                    textEn: getJsonField(
                                                      karuselliUusiItem,
                                                      r'''$.textEn''',
                                                    ).toString(),
                                                    onCardTapped: (id) async {},
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(0,
                                                    karuselliUusi.length - 1)),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'mg9h30y0' /* Back to Menu */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                .divide(SizedBox(height: 8.0))
                .addToStart(SizedBox(height: 24.0))
                .addToEnd(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
