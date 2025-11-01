import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'maikki_model.dart';
export 'maikki_model.dart';

class MaikkiWidget extends StatefulWidget {
  const MaikkiWidget({super.key});

  static String routeName = 'Maikki';
  static String routePath = '/maikki';

  @override
  State<MaikkiWidget> createState() => _MaikkiWidgetState();
}

class _MaikkiWidgetState extends State<MaikkiWidget> {
  late MaikkiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaikkiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1500,
        ),
      );
      _model.apiResultFeelingsAndMood =
          await GetCategoryProgressMoodAndFeelingsCall.call(
        userId: currentUserUid,
        category: 'FeelingsAndMood',
        language: 'fi',
      );

      if (getJsonField(
            (_model.apiResultFeelingsAndMood?.jsonBody ?? ''),
            r'''$.progress''',
          ) !=
          null) {
        _model.progressMood = getJsonField(
          (_model.apiResultFeelingsAndMood?.jsonBody ?? ''),
          r'''$.progress''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ei dataa',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Theme.of(context).brightness == Brightness.light
    ? const Color(0xFFFFFFFF)
    : FlutterFlowTheme.of(context).secondaryBackground,


          ),
        );
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultThinkingAndDecisions =
          await GetCategoryProgressThinkingAndDecisionsCall.call(
        userId: currentUserUid,
        category: 'ThinkingAndDecisions',
        language: 'fi',
      );

      if (getJsonField(
            (_model.apiResultThinkingAndDecisions?.jsonBody ?? ''),
            r'''$.progress''',
          ) !=
          null) {
        _model.progressDicessions = getJsonField(
          (_model.apiResultThinkingAndDecisions?.jsonBody ?? ''),
          r'''$.progress''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ei dataa',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultConnectionAndBelonging =
          await GetCategoryProgressConnectionAndBelongingCall.call(
        userId: currentUserUid,
        category: 'ConnectionAndBelonging',
        language: 'fi',
      );

      if (getJsonField(
            (_model.apiResultConnectionAndBelonging?.jsonBody ?? ''),
            r'''$.progress''',
          ) !=
          null) {
        _model.progressBelonging = getJsonField(
          (_model.apiResultConnectionAndBelonging?.jsonBody ?? ''),
          r'''$.progress''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ei dataa',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultGrowthAndStrength =
          await GetCategoryProgressGrowthAndStrengthCall.call(
        userId: currentUserUid,
        category: 'GrowthAndStrength',
        language: 'fi',
      );

      if (getJsonField(
            (_model.apiResultGrowthAndStrength?.jsonBody ?? ''),
            r'''$.progress''',
          ) !=
          null) {
        _model.progressGrowth = getJsonField(
          (_model.apiResultGrowthAndStrength?.jsonBody ?? ''),
          r'''$.progress''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ei dataa',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.apiResultWorkandwellbeing =
          await GetCategoryProgressWorkandwellbeingCall.call(
        userId: currentUserUid,
        category: 'Workandwellbeing',
        language: 'fi',
      );

      if (getJsonField(
            (_model.apiResultWorkandwellbeing?.jsonBody ?? ''),
            r'''$.progress''',
          ) !=
          null) {
        _model.progressWork = getJsonField(
          (_model.apiResultWorkandwellbeing?.jsonBody ?? ''),
          r'''$.progress''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ei dataa',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              context.pushNamed(GettingStartedWidget.routeName);
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              'nj8c8mb7' /* MID Tests */,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/nature-9656443_1280.png',
                                            width: 93.0,
                                            height: 93.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qpriehy7' /* Feelings & Mood  */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 2.0, 12.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  getJsonField(
                                                    (_model.apiResultFeelingsAndMood
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.done''',
                                                  )?.toString(),
                                                  '0',
                                                )}/${valueOrDefault<String>(
                                                  getJsonField(
                                                    (_model.apiResultFeelingsAndMood
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.total''',
                                                  )?.toString(),
                                                  '10',
                                                )}',
                                                textAlign: TextAlign.end,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 8.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'deqn34ia' /* Test your mood */,
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: LinearPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  _model.progressMood,
                                                  0.0,
                                                ),
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                barRadius:
                                                    Radius.circular(100.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 4.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future:
                                                    GetTestsByCategoryAndLanguageMoodCall
                                                        .call(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final dropDownMoodGetTestsByCategoryAndLanguageMoodResponse =
                                                      snapshot.data!;

                                                  return FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownMoodValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: List<String>.from(
                                                        (getJsonField(
                                                      dropDownMoodGetTestsByCategoryAndLanguageMoodResponse
                                                          .jsonBody,
                                                      r'''$.tests[:].id''',
                                                      true,
                                                    ) as List?)!
                                                            .map<String>((e) =>
                                                                e.toString())
                                                            .toList()
                                                            .cast<String>()),
                                                    optionLabels: (getJsonField(
                                                      dropDownMoodGetTestsByCategoryAndLanguageMoodResponse
                                                          .jsonBody,
                                                      r'''$.tests[:].testName''',
                                                      true,
                                                    ) as List?)!
                                                        .map<String>(
                                                            (e) => e.toString())
                                                        .toList()
                                                        .cast<String>(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .dropDownMoodValue =
                                                          val);
                                                      _model.selectedTestId =
                                                          _model
                                                              .dropDownMoodValue;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                        ConfidenceTestPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'testID':
                                                              serializeParam(
                                                            _model
                                                                .dropDownMoodValue,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.05,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: () {
                                                                if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointSmall) {
                                                                  return 13.0;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointMedium) {
                                                                  return 14.0;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointLarge) {
                                                                  return 16.0;
                                                                } else {
                                                                  return 16.0;
                                                                }
                                                              }(),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '6i6qqdgl' /* Select... */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor1,
                                                    elevation: 10.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 2.0,
                                                                12.0, 2.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                                Divider(
                                  height: 0.1,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Untitled_design-2.png',
                                                  width: 93.0,
                                                  height: 97.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'e7eurs3i' /* Thinking & Dicessions */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.4,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          '${valueOrDefault<String>(
                                                            getJsonField(
                                                              (_model.apiResultThinkingAndDecisions
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.done''',
                                                            )?.toString(),
                                                            '0',
                                                          )}/${valueOrDefault<String>(
                                                            getJsonField(
                                                              (_model.apiResultThinkingAndDecisions
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.total''',
                                                            )?.toString(),
                                                            '10',
                                                          )}',
                                                          '0/10',
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'qye6t0b9' /* Track your values */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: valueOrDefault<
                                                            double>(
                                                          _model
                                                              .progressDicessions,
                                                          0.0,
                                                        ),
                                                        lineHeight: 8.0,
                                                        animation: true,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        barRadius:
                                                            Radius.circular(
                                                                100.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetThinkingAndDecisionsTestsCall
                                                                  .call(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final dropDownThinkingGetThinkingAndDecisionsTestsResponse =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownThinkingValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: List<
                                                                      String>.from(
                                                                  (getJsonField(
                                                                dropDownThinkingGetThinkingAndDecisionsTestsResponse
                                                                    .jsonBody,
                                                                r'''$.tests[:].id''',
                                                                true,
                                                              ) as List?)!
                                                                      .map<String>(
                                                                          (e) => e
                                                                              .toString())
                                                                      .toList()
                                                                      .cast<
                                                                          String>()),
                                                              optionLabels:
                                                                  (getJsonField(
                                                                dropDownThinkingGetThinkingAndDecisionsTestsResponse
                                                                    .jsonBody,
                                                                r'''$.tests[:].testName''',
                                                                true,
                                                              ) as List?)!
                                                                      .map<String>(
                                                                          (e) => e
                                                                              .toString())
                                                                      .toList()
                                                                      .cast<
                                                                          String>(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDownThinkingValue =
                                                                        val);
                                                                _model.selectedTestId =
                                                                    _model
                                                                        .dropDownThinkingValue;
                                                                safeSetState(
                                                                    () {});

                                                                context
                                                                    .pushNamed(
                                                                  ConfidenceTestPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'testID':
                                                                        serializeParam(
                                                                      _model
                                                                          .dropDownThinkingValue,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.05,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 13.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 14.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 16.0;
                                                                          } else {
                                                                            return 16.0;
                                                                          }
                                                                        }(),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'hb8hba0d' /* Select... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                              elevation: 10.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          2.0,
                                                                          12.0,
                                                                          2.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                        Divider(
                                          height: 0.1,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/balloons-892806_1280.png',
                                                          width: 93.0,
                                                          height: 97.0,
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment(
                                                              0.0, 0.0),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wg9i2stz' /* Connection & Belonging */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.4,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      (_model.apiResultConnectionAndBelonging
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.done''',
                                                                    )?.toString(),
                                                                    '0',
                                                                  )}/${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      (_model.apiResultConnectionAndBelonging
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.total''',
                                                                    )?.toString(),
                                                                    '10',
                                                                  )}',
                                                                  '0/10',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.3,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nvx02jhy' /* Do you bond with others */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.3,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child:
                                                                  LinearPercentIndicator(
                                                                percent:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  _model
                                                                      .progressBelonging,
                                                                  0.0,
                                                                ),
                                                                lineHeight: 8.0,
                                                                animation: true,
                                                                animateFromLastPercent:
                                                                    true,
                                                                progressColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                barRadius: Radius
                                                                    .circular(
                                                                        100.0),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future:
                                                                    GetConnectionAndBelongingTestsCall
                                                                        .call(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final dropDownBelongGetConnectionAndBelongingTestsResponse =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownBelongValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownBelongValue ??=
                                                                          '',
                                                                    ),
                                                                    options: List<
                                                                        String>.from((getJsonField(
                                                                      dropDownBelongGetConnectionAndBelongingTestsResponse
                                                                          .jsonBody,
                                                                      r'''$.tests[:].id''',
                                                                      true,
                                                                    ) as List?)!
                                                                        .map<String>((e) => e.toString())
                                                                        .toList()
                                                                        .cast<String>()),
                                                                    optionLabels: (getJsonField(
                                                                      dropDownBelongGetConnectionAndBelongingTestsResponse
                                                                          .jsonBody,
                                                                      r'''$.tests[:].testName''',
                                                                      true,
                                                                    ) as List?)!
                                                                        .map<String>((e) => e.toString())
                                                                        .toList()
                                                                        .cast<String>(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownBelongValue =
                                                                              val);
                                                                      _model.selectedTestId =
                                                                          _model
                                                                              .dropDownBelongValue;
                                                                      safeSetState(
                                                                          () {});

                                                                      context
                                                                          .pushNamed(
                                                                        ConfidenceTestPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'testID':
                                                                              serializeParam(
                                                                            _model.dropDownBelongValue,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.05,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 13.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 14.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 16.0;
                                                                            } else {
                                                                              return 16.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sf5lhl5f' /* Select... */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                    elevation:
                                                                        10.0,
                                                                    borderColor:
                                                                        Color(
                                                                            0x0D94B5D8),
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            2.0,
                                                                            12.0,
                                                                            2.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 0.1,
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/feet-1779064_1280.png',
                                                                  width: 93.0,
                                                                  height: 97.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'vv8m361c' /* Growth &  Strength */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 1.4,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            '${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                (_model.apiResultGrowthAndStrength?.jsonBody ?? ''),
                                                                                r'''$.done''',
                                                                              )?.toString(),
                                                                              '0',
                                                                            )}/${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                (_model.apiResultGrowthAndStrength?.jsonBody ?? ''),
                                                                                r'''$.total''',
                                                                              )?.toString(),
                                                                              '10',
                                                                            )}',
                                                                            '0/10',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 1.3,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'utm39wbo' /* Which are your strongest areas */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 1.3,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            LinearPercentIndicator(
                                                                          percent:
                                                                              valueOrDefault<double>(
                                                                            _model.progressGrowth,
                                                                            0.0,
                                                                          ),
                                                                          lineHeight:
                                                                              8.0,
                                                                          animation:
                                                                              true,
                                                                          animateFromLastPercent:
                                                                              true,
                                                                          progressColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).customColor3,
                                                                          barRadius:
                                                                              Radius.circular(100.0),
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future:
                                                                              GetGrowthAndStrengthTestsCall.call(),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            final dropDownGrowthGetGrowthAndStrengthTestsResponse =
                                                                                snapshot.data!;

                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownGrowthValueController ??= FormFieldController<String>(
                                                                                _model.dropDownGrowthValue ??= '',
                                                                              ),
                                                                              options: List<String>.from((getJsonField(
                                                                                dropDownGrowthGetGrowthAndStrengthTestsResponse.jsonBody,
                                                                                r'''$.tests[:].id''',
                                                                                true,
                                                                              ) as List?)!
                                                                                  .map<String>((e) => e.toString())
                                                                                  .toList()
                                                                                  .cast<String>()),
                                                                              optionLabels: (getJsonField(
                                                                                dropDownGrowthGetGrowthAndStrengthTestsResponse.jsonBody,
                                                                                r'''$.tests[:].testName''',
                                                                                true,
                                                                              ) as List?)!
                                                                                  .map<String>((e) => e.toString())
                                                                                  .toList()
                                                                                  .cast<String>(),
                                                                              onChanged: (val) async {
                                                                                safeSetState(() => _model.dropDownGrowthValue = val);
                                                                                _model.selectedTestId = _model.dropDownGrowthValue;
                                                                                safeSetState(() {});

                                                                                context.pushNamed(
                                                                                  ConfidenceTestPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'testID': serializeParam(
                                                                                      _model.dropDownGrowthValue,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              height: MediaQuery.sizeOf(context).height * 0.05,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return 13.0;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return 14.0;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return 16.0;
                                                                                      } else {
                                                                                        return 16.0;
                                                                                      }
                                                                                    }(),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'v3n9abyv' /* Select... */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).customColor1,
                                                                              elevation: 10.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 12.0, 2.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: false,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.1,
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Untitled_design.png',
                                                                          width:
                                                                              93.0,
                                                                          height:
                                                                              97.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'v6jsxz0q' /* Work & Wellbeing */,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.4,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  '${valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      (_model.apiResultWorkandwellbeing?.jsonBody ?? ''),
                                                                                      r'''$.done''',
                                                                                    )?.toString(),
                                                                                    '0',
                                                                                  )}/${valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      (_model.apiResultWorkandwellbeing?.jsonBody ?? ''),
                                                                                      r'''$.total''',
                                                                                    )?.toString(),
                                                                                    '10',
                                                                                  )}',
                                                                                  '0/10',
                                                                                ),
                                                                                textAlign: TextAlign.end,
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.3,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ruf76hqy' /* Check your balance */,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.3,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: valueOrDefault<double>(
                                                                                  _model.progressWork,
                                                                                  0.0,
                                                                                ),
                                                                                lineHeight: 8.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                                                backgroundColor: FlutterFlowTheme.of(context).customColor3,
                                                                                barRadius: Radius.circular(100.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 4.0),
                                                                              child: FutureBuilder<ApiCallResponse>(
                                                                                future: GetWorkandwellbeingTestsCall.call(),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  final dropDownWorkGetWorkandwellbeingTestsResponse = snapshot.data!;

                                                                                  return FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownWorkValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownWorkValue ??= '',
                                                                                    ),
                                                                                    options: List<String>.from((getJsonField(
                                                                                      dropDownWorkGetWorkandwellbeingTestsResponse.jsonBody,
                                                                                      r'''$.tests[:].id''',
                                                                                      true,
                                                                                    ) as List?)!
                                                                                        .map<String>((e) => e.toString())
                                                                                        .toList()
                                                                                        .cast<String>()),
                                                                                    optionLabels: (getJsonField(
                                                                                      dropDownWorkGetWorkandwellbeingTestsResponse.jsonBody,
                                                                                      r'''$.tests[:].testName''',
                                                                                      true,
                                                                                    ) as List?)!
                                                                                        .map<String>((e) => e.toString())
                                                                                        .toList()
                                                                                        .cast<String>(),
                                                                                    onChanged: (val) async {
                                                                                      safeSetState(() => _model.dropDownWorkValue = val);
                                                                                      _model.selectedTestId = _model.dropDownWorkValue;
                                                                                      safeSetState(() {});

                                                                                      context.pushNamed(
                                                                                        ConfidenceTestPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'testID': serializeParam(
                                                                                            _model.dropDownWorkValue,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: () {
                                                                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                              return 12.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                              return 14.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                              return 16.0;
                                                                                            } else {
                                                                                              return 16.0;
                                                                                            }
                                                                                          }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      '9fou7bjs' /* Select... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).customColor1,
                                                                                    elevation: 10.0,
                                                                                    borderColor: Colors.transparent,
                                                                                    borderWidth: 0.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 12.0, 2.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: false,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 0.1,
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            16.0,
                                                                            8.0,
                                                                            16.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context.pushNamed(
                                                                            SavedTest1Widget.routeName);
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4yy8b9b6' /* Saved test results */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.85,
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor8,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            16.0,
                                                                            8.0,
                                                                            16.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context.pushNamed(
                                                                            PageLittleWidget.routeName);
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8skenfof' /* Small Acts  💫 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.85,
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            16.0,
                                                                            8.0,
                                                                            16.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context.pushNamed(
                                                                            PageReflectionssWidget.routeName);
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'obe86gqb' /* Daily Reflection  ☘️ */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.85,
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor6,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
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
                                                ),
                                              ],
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
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
