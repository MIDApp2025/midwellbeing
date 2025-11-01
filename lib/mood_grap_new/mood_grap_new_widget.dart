import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/modal_calender_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'mood_grap_new_model.dart';
export 'mood_grap_new_model.dart';

class MoodGrapNewWidget extends StatefulWidget {
  const MoodGrapNewWidget({super.key});

  static String routeName = 'MoodGrapNew';
  static String routePath = '/moodGraphNew';

  @override
  State<MoodGrapNewWidget> createState() => _MoodGrapNewWidgetState();
}

class _MoodGrapNewWidgetState extends State<MoodGrapNewWidget> {
  late MoodGrapNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodGrapNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiCalender = await GetMoodDatesCalenderCall.call(
        userId: currentUserUid,
        entryType: 'mood',
        startDate: functions.getFirstDayOfYear(),
        endDate: functions.getLastDayOfYear(),
      );

      await Future.delayed(
        Duration(
          milliseconds: 200,
        ),
      );
      if (_model.apiCalender != null) {
        _model.calenderDates = (getJsonField(
          (_model.apiCalender?.jsonBody ?? ''),
          r'''$.dates''',
          true,
        ) as List?)!
            .map<String>((e) => e.toString())
            .toList()
            .cast<String>()
            .toList()
            .cast<String>();
        safeSetState(() {});
        _model.markedYmdDates = _model.calenderDates.toList().cast<String>();
        _model.summaryItemsCalender = getJsonField(
          (_model.apiCalender?.jsonBody ?? ''),
          r'''$.items''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.calenderDates =
            functions.emptyStringList()!.toList().cast<String>();
        safeSetState(() {});
        _model.summaryItemsCalender =
            functions.emptyJsonObject()!.toList().cast<dynamic>();
        safeSetState(() {});
        _model.markedDatesForCalendar =
            functions.emptyDateTimeList()!.toList().cast<DateTime>();
        safeSetState(() {});
      }

      await Future.delayed(
        Duration(
          milliseconds: 200,
        ),
      );
      _model.moodResponse = await GetDailySummaryMoodCall.call(
        userId: currentUserUid,
        language: FFLocalizations.of(context).languageCode,
        date: dateTimeFormat(
          "yyyy-MM-dd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        type: 'mood',
      );

      if (_model.moodResponse != null) {
        _model.moodResponseTest = getJsonField(
          (_model.moodResponse?.jsonBody ?? ''),
          r'''$.summary''',
        ).toString();
        safeSetState(() {});
      } else {
        _model.moodResponseTest = functions.returnEmptyString();
        safeSetState(() {});
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultProg = await GetEntriesByRangeMoodCall.call(
  userId: currentUserUid,
  type: 'mood',
  range: 'month',
  date: dateTimeFormat(
    "yyyy-MM-dd",
    getCurrentTimestamp,
    locale: FFLocalizations.of(context).languageCode,
  ),
);

await Future.delayed(
  Duration(milliseconds: 300),
);

if (_model.apiResultProg != null) {
  final json = _model.apiResultProg?.jsonBody;

  _model.progress =
      (getJsonField(json, r'''$.progress''') as num?)?.toDouble() ?? 0.0;

  _model.average =
      (getJsonField(json, r'''$.average''') as num?)?.toDouble() ?? 0.0;

  safeSetState(() {});
} else {
  final json = _model.apiResultProg?.jsonBody;

  _model.progress =
      (getJsonField(json, r'''$.progress''') as num?)?.toDouble() ?? 0.01;

  _model.average =
      (getJsonField(json, r'''$.average''') as num?)?.toDouble() ?? 0.0;

  safeSetState(() {});
}

    });

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
              context.pushNamed(MygrowthWidget.routeName);
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              'syolyhon' /* MID Stats Mood */,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 16.0),
                    child: AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'jz3mklbk' /* Mood */,
                      ),
                      minFontSize: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 22.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 22.0;
                        } else {
                          return 24.0;
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (getJsonField(
                          (_model.apiResultProg?.jsonBody ?? ''),
                          r'''$.progress''',
                        ) ==
                        null)
                      Text(
                        FFLocalizations.of(context).getText(
                          'kg410nbt' /* Loading... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (getJsonField(
                                  (_model.apiResultProg?.jsonBody ?? ''),
                                  r'''$.progress''',
                                ) !=
                                null)
                              CircularPercentIndicator(
                                percent: valueOrDefault<double>(
  (_model.progress as num?)?.toDouble(),
  0.01,
),

                                radius: 45.0,
                                lineWidth: 6.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                backgroundColor: Color(0xFFDAE1E1),
                                center: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      _model.average,
                                      formatType: FormatType.custom,
                                      format: '#0.0',
                                      locale: '',
                                    ),
                                    '0.001',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.15),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: SelectionArea(
                                    child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ynkhohks' /* Mood this month */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 440.0,
                              child: custom_widgets.MyCalendar(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 440.0,
                                markedDates: _model.markedDatesForCalendar,
                                markedYmdDates: _model.calenderDates,
                                entryType: 'mood',
                                onDaySelected: (selectedDay) async {
                                  _model.apiResult3on =
                                      await GetMoodDatesCalenderCall.call(
                                    userId: currentUserUid,
                                    entryType: 'mood',
                                    startDate: selectedDay,
                                    endDate: selectedDay,
                                  );

                                  if ((_model.apiResult3on?.succeeded ??
                                      true)) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalCalenderWidget(
                                              dailySummary: (_model
                                                      .apiResult3on?.jsonBody ??
                                                  ''),
                                              userId: currentUserUid,
                                              type: 'mood',
                                              date: selectedDay,
                                              entryType: 'mood',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 8.0, 10.0, 12.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'jqygmu50' /* Today´s Mood Summary */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.moodResponseTest,
                                        'Coming soon',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 14.5;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 15.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 16.0;
                                              } else {
                                                return 18.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
