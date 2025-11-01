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
import 'confidence_graph_model.dart';
export 'confidence_graph_model.dart';

class ConfidenceGraphWidget extends StatefulWidget {
  const ConfidenceGraphWidget({super.key});

  static String routeName = 'ConfidenceGraph';
  static String routePath = '/confidenceGraph';

  @override
  State<ConfidenceGraphWidget> createState() => _ConfidenceGraphWidgetState();
}

class _ConfidenceGraphWidgetState extends State<ConfidenceGraphWidget> {
  late ConfidenceGraphModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfidenceGraphModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentMonthStart = functions.getFirstDayOfYear();
      safeSetState(() {});
      _model.currentMonthEnd = functions.getLastDayOfYear();
      safeSetState(() {});
      _model.calenderload = await GetConfidenceDatesCalenderCall.call(
        userId: currentUserUid,
        entryType: 'confidence',
        startDate: _model.currentMonthStart,
        endDate: _model.currentMonthEnd,
      );

      await Future.delayed(
        Duration(
          milliseconds: 200,
        ),
      );
      if (_model.calenderload != null) {
        _model.calendarDates = (getJsonField(
          (_model.calenderload?.jsonBody ?? ''),
          r'''$.dates''',
          true,
        ) as List?)!
            .map<String>((e) => e.toString())
            .toList()
            .cast<String>()
            .toList()
            .cast<String>();
        safeSetState(() {});
        _model.markedYmdDates = _model.calendarDates.toList().cast<String>();
        _model.summaryItemsCalender = getJsonField(
          (_model.calenderload?.jsonBody ?? ''),
          r'''$.items''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.calendarDates =
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
      _model.confidenceResponse = await GetDailySummaryConfidenceCall.call(
        userId: currentUserUid,
        date: dateTimeFormat(
          "yyyy-MM-dd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        type: 'confidence',
        language: FFLocalizations.of(context).languageCode,
      );

      if (_model.confidenceResponse != null) {
        _model.confidenceText = getJsonField(
          (_model.confidenceResponse?.jsonBody ?? ''),
          r'''$.summary''',
        ).toString();
        safeSetState(() {});
      } else {
        _model.confidenceText = functions.returnEmptyString();
        safeSetState(() {});
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultProg = await GetEntriesByRangeConfidenceCall.call(
  userId: currentUserUid,
  type: 'confidence',
  date: dateTimeFormat(
    "yyyy-MM-dd",
    getCurrentTimestamp,
    locale: FFLocalizations.of(context).languageCode,
  ),
  range: 'month',
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
              'qq55x6nf' /* MID Stats Confidence */,
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
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 0.0, 16.0),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'ecnl4ubw' /* Confidence */,
                                      ),
                                      minFontSize: 22.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 20.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 22.0;
                                              } else {
                                                return 24.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                if (_model.progress == null)
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'y44iqqhc' /* Loading ... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                if (_model.progress != null)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: CircularPercentIndicator(
                                        percent: valueOrDefault<double>(
  (_model.progress as num?)?.toDouble(),
  0.01,
),

                                        radius: 45.0,
                                        lineWidth: 6.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                        ),
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
                                        'd7vtekkz' /* Self-confidencethis month */,
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
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.calenderload != null)
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 440.0,
                                child: custom_widgets.MyCalendar(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 440.0,
                                  markedDates: functions.emptyDateTimeList(),
                                  markedYmdDates: _model.calendarDates,
                                  entryType: 'confidence',
                                  onDaySelected: (selectedDay) async {
                                    _model.selectedDay = selectedDay;
                                    safeSetState(() {});
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                    _model.apiResultp8y =
                                        await GetConfidenceDatesCalenderCall
                                            .call(
                                      userId: currentUserUid,
                                      entryType: 'confidence',
                                      startDate: _model.selectedDay,
                                      endDate: _model.selectedDay,
                                    );

                                    if ((_model.apiResultp8y?.succeeded ??
                                        true)) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        barrierColor:
                                            FlutterFlowTheme.of(context).custom,
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
                                                        .apiResultp8y
                                                        ?.jsonBody ??
                                                    ''),
                                                userId: currentUserUid,
                                                type: 'confidence',
                                                date: selectedDay,
                                                entryType: 'confidence',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Ei dataa tälle päivälle',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: SafeArea(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 8.0),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'bbljhr45' /* Today´s Self-confidence Summar... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      minFontSize: 16.0,
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
                                            color: FlutterFlowTheme.of(context)
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
                                      16.0, 8.0, 16.0, 16.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.confidenceText,
                                      'Daily Summary is coming',
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
                                          lineHeight: 1.6,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
