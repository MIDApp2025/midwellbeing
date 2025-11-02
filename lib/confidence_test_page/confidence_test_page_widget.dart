import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'confidence_test_page_model.dart';
export 'confidence_test_page_model.dart';

class ConfidenceTestPageWidget extends StatefulWidget {
  const ConfidenceTestPageWidget({
    super.key,
    required this.testID,
  });

  final String? testID;

  static String routeName = 'confidenceTestPage';
  static String routePath = '/confidenceTestPage';

  @override
  State<ConfidenceTestPageWidget> createState() =>
      _ConfidenceTestPageWidgetState();
}

class _ConfidenceTestPageWidgetState extends State<ConfidenceTestPageWidget> {
  late ConfidenceTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfidenceTestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.sessionId = functions.generateUuid();
      safeSetState(() {});
    });

    _model.textFieldUserCCCCTextController ??=
        TextEditingController(text: FFAppState().textField);
    _model.textFieldUserCCCCFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
    ? FlutterFlowTheme.of(context).secondaryBackground
    : const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0x0094B5D8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20,
            buttonSize: 40,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            onPressed: () async {
  var confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) {
          final locale = FFLocalizations.of(context).languageCode;
          final isFinnish = locale == 'fi';
          return AlertDialog(
            title: Text(isFinnish ? 'Poistutko testistä?' : 'Leave the test?'),
            content: Text(isFinnish
                ? 'Vastauksesi tallentuvat vain, jos olet suorittanut testin loppuun.'
                : 'Your answers are saved only if you have completed the test.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, false),
                child: Text(isFinnish ? 'Jatka testissä' : 'Stay here'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, true),
                child: Text(isFinnish ? 'Poistu testistä' : 'Exit test'),
              ),
            ],
          );
        },
      ) ??
      false;
  if (confirmDialogResponse) {
    context.pushNamed(MaikkiWidget.routeName);
  }
},

          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              'um82pz07' /* MID Test */,
            ),
            minFontSize: 16,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.showInitialText)
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'fxs6pi1z' /* Welcome to your personal growt... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 13.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 16.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 18.0;
                                        } else {
                                          return 18.0;
                                        }
                                      }(),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.3,
                                    ),
                              ),
                            ),
                          ),
                        if (!_model.showInitialText)
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            (_model.apiButtonMessage
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.message.content''',
                                          )?.toString(),
                                          '❤️',
                                        ),
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
                                                  return 14.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 16.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 18.0;
                                                } else {
                                                  return 20.0;
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
                                    if (_model.showUserAnswer)
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 30, 16),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.latestUserAnswer,
                                              'user answer',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.manrope(
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
                                                  fontSize: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 14.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 16.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 18.0;
                                                    } else {
                                                      return 20.0;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.15,
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
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Stack(
                    alignment: AlignmentDirectional(0, 0),
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 4, 10, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (FFAppState().isComplited == false)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 12, 8, 12),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    child: TextFormField(
                                      controller: _model
                                          .textFieldUserCCCCTextController,
                                      focusNode:
                                          _model.textFieldUserCCCCFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      textInputAction: TextInputAction.send,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'oravpt5g' /* Type here...  */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor7,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.openSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
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
                                      maxLines: 3,
                                      minLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .textFieldUserCCCCTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        if (!isAndroid && !isiOS)
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            return TextEditingValue(
                                              selection: newValue.selection,
                                              text: newValue.text
                                                  .toCapitalization(
                                                      TextCapitalization
                                                          .sentences),
                                            );
                                          }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().isComplited == false)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    _model.showUserAnswer = true;
                                    _model.latestUserAnswer = _model
                                        .textFieldUserCCCCTextController.text;
                                    safeSetState(() {});
                                    _model.apiButtonMessage =
                                        await GetTestQuestionsCall.call(
                                      testId: widget!.testID,
                                      sessionId: _model.sessionId,
                                      answer: int.tryParse(_model
                                          .textFieldUserCCCCTextController
                                          .text),
                                      openAnswer: _model
                                          .textFieldUserCCCCTextController.text,
                                      userId: currentUserUid,
                                    );

                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 200,
                                      ),
                                    );
                                    safeSetState(() {
                                      _model.textFieldUserCCCCTextController
                                          ?.clear();
                                    });
                                    FFAppState().apiButtonMessage =
                                        getJsonField(
                                      (_model.apiButtonMessage?.jsonBody ?? ''),
                                      r'''$.message.content''',
                                    ).toString();
                                    safeSetState(() {});
                                    _model.showInitialText = false;
                                    safeSetState(() {});
                                    _model.showUserAnswer = false;
                                    safeSetState(() {});
                                    FFAppState().isComplited = getJsonField(
                                      (_model.apiButtonMessage?.jsonBody ?? ''),
                                      r'''$.completed''',
                                    );
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (FFAppState().isComplited == true)
                        wrapWithModel(
                          model: _model.navBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
