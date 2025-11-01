import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'm_i_d_chat_a_i_copy_model.dart';
export 'm_i_d_chat_a_i_copy_model.dart';
import 'dart:async';


class MIDChatAICopyWidget extends StatefulWidget {
  const MIDChatAICopyWidget({
    super.key,
    this.fromHistory,
  });

  final bool? fromHistory;

  static String routeName = 'MIDChatAICopy';
  static String routePath = '/mIDChatAICopy';

  @override
  State<MIDChatAICopyWidget> createState() => _MIDChatAICopyWidgetState();
}

class _MIDChatAICopyWidgetState extends State<MIDChatAICopyWidget> {
  late MIDChatAICopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  // 🔹 Lisätty: mikrofonin tekstin hallintamuuttujat
  String _lastMicText = '';
  String _previousSessionText = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MIDChatAICopyModel());

    // On page load action.
SchedulerBinding.instance.addPostFrameCallback((_) async {
  if (!(FFAppState().activeSessionIdApp != '')) {
    _model.tempUuid = functions.generateUuid();
    safeSetState(() {});
    await Future.delayed(
      Duration(
        milliseconds: 200,
      ),
    );
    FFAppState().activeSessionIdApp = _model.tempUuid!;
    safeSetState(() {});
    _model.apiResultPageLoadUUid =
        await LuoSessionIdCreateChatSessionCall.call(
      userId: currentUserUid,
      sessionId: FFAppState().activeSessionIdApp,
      hasUpdatedTitle: 'false',
    );
  }

  // 🩵 Tämä rivi poistettu, koska otsikko päivittyy backendin kautta myöhemmin automaattisesti
  // await actions.createOrUpdateChatSessionTitle("New Chat");

  print('✅ Chat session initialized: ${FFAppState().activeSessionIdApp}');

  await Future.delayed(
    Duration(
      milliseconds: 200,
    ),
  );

  if (FFAppState().hasSentHistory) {
    _model.apiResultPageLoad = await ChatContextLatestAndArchiveCall.call(
      userId: currentUserUid,
      sessionId: FFAppState().activeSessionIdApp,
      limit: '3',
    );

    FFAppState().chatMemoryContext = getJsonField(
      (_model.apiResultPageLoad?.jsonBody ?? ''),
      r'''$.history''',
    ).toString();
    safeSetState(() {});
  }
});

    _model.promptMessageUserControllerTextController ??=
        TextEditingController(text: FFAppState().micText);
    _model.promptMessageUserControllerFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
    // 🟢 Reaaliaikainen mikrofoni-tekstin seuranta (tasapainoinen versio)
String _lastMicText = '';
String _accumulatedText = '';
Timer? _debounce;

FFAppState().addListener(() {
  final controller = _model.promptMessageUserControllerTextController;
  if (controller == null) return;

  final raw = FFAppState().micText.trim();
  final micText = raw.replaceAll(RegExp(r'^"|"$'), '');

  // Ei muutosta
  if (micText == _lastMicText) return;
  _lastMicText = micText;

  // Jos tyhjentyy (mikrofoni pois päältä)
  if (micText.isEmpty) {
  // Mikrofoni pysähtyi, mutta säilytä pohjateksti seuraavaa starttia varten
  if (controller.text.trim().isNotEmpty) {
    _accumulatedText = controller.text.trim();
  }
  return;
}

  // Debounce (lyhyt rytmitys)
  _debounce?.cancel();
  _debounce = Timer(const Duration(milliseconds: 200), () {
    // Lisätään vain uudet sanat
    if (micText.startsWith(_accumulatedText)) {
      final extra = micText.substring(_accumulatedText.length);
      controller.text = (_accumulatedText + extra).trim();
    } else {
      controller.text = micText; // fallback jos ei alka samalla
    }

    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    safeSetState(() {});
  });
});
  } // ← tämä sulkee initState:n

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
        backgroundColor: FlutterFlowTheme.of(context).accent3,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        endDrawer: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            safeSetState(() {});
          },
          child: Drawer(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
    ? const Color(0xFF1E1E1E) // tumma teema
    : const Color(0xFFFFFFFF), // vaalea teema (valkoinen)
            elevation: 16.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'tktk5ew5' /* Chats */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 10.0,
                          buttonSize: 45.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).info,
                          ),
                          onPressed: () async {
                            await actions.clearMicText();
                            await CloseChatSessionExitCall.call(
                              userId: currentUserUid,
                              sessionId: FFAppState().activeSessionIdApp,
                            );

                            await Future.delayed(
                              Duration(
                                milliseconds: 200,
                              ),
                            );
                            _model.tempUuid = functions.generateUuid();
                            safeSetState(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 300,
                              ),
                            );
                            await LuoSessionIdCreateChatSessionCall.call(
                              userId: currentUserUid,
                              hasUpdatedTitle: 'false',
                              sessionId: _model.tempUuid,
                            );

                            await Future.delayed(
                              Duration(
                                milliseconds: 200,
                              ),
                            );
                            FFAppState().activeSessionIdApp = _model.tempUuid!;
                            safeSetState(() {});
                            FFAppState().chat = [];
                            safeSetState(() {});
                            if (scaffoldKey.currentState!.isDrawerOpen ||
                                scaffoldKey.currentState!.isEndDrawerOpen) {
                              Navigator.pop(context);
                            }

                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(MIDChatAICopyWidget.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 6),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: TextFormField(
                      key: ValueKey(_model.queryFieldTextController?.text ?? ''),

                      controller: _model.queryFieldTextController,
                      focusNode: _model.queryFieldFocusNode,
                      onChanged: (value) {
  // 🔹 Tämä varmistaa, että X (suffixIcon) päivittyy heti
  setState(() {});

  // 🔹 Tämä hoitaa haun pienen viiveen jälkeen
  EasyDebounce.debounce(
    '_model.queryFieldTextController',
    Duration(milliseconds: 500),
    () {
      setState(() {
        _model.querySearch = value.toLowerCase();
      });
    },
  );
},


                      onFieldSubmitted: (_) async {
                        _model.querySearch =
                            _model.queryFieldTextController.text;
                        safeSetState(() {});
                      },
                      autofocus: false,
                      enabled: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'ckaazzf2' /* Search a chat */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  color: Colors.grey,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        suffixIcon: (_model.queryFieldTextController?.text.isNotEmpty ?? false)
                            ? InkWell(
                                onTap: () async {
                                  _model.queryFieldTextController?.clear();
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              )
                            : null,
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
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator: _model.queryFieldTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: FutureBuilder<ApiCallResponse>(
                      key: ValueKey(_model.querySearch),
                      future: DraverListViewCall.call(
                        userId: currentUserUid,
                         q: _model.querySearch,
                      ),
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
                        final listViewDraverListViewResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final sessionuu = getJsonField(
                              listViewDraverListViewResponse.jsonBody,
                              r'''$.sessions''',
                            ).toList().take(20).toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: sessionuu.length,
                              itemBuilder: (context, sessionuuIndex) {
                                final sessionuuItem = sessionuu[sessionuuIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().chat = [];
                                      safeSetState(() {});
                                      FFAppState().activeSessionIdApp =
                                          getJsonField(
                                        sessionuuItem,
                                        r'''$.sessionId''',
                                      ).toString();
                                      safeSetState(() {});
                                      FFAppState().isHydrating = true;
                                      safeSetState(() {});
                                      _model.getSessionMessages =
                                          await GetSessionMessagesCall.call(
                                        sessionId:
                                            FFAppState().activeSessionIdApp,
                                        userId: currentUserUid,
                                      );

                                      for (int loop1Index = 0;
                                          loop1Index <
                                              getJsonField(
                                                (_model.getSessionMessages
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.messages''',
                                                true,
                                              )!
                                                  .length;
                                          loop1Index++) {
                                        final currentLoop1Item = getJsonField(
                                          (_model.getSessionMessages
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.messages''',
                                          true,
                                        )![loop1Index];
                                        FFAppState().addToChat(MessageStruct(
                                          text: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.text,
                                          timeStamp: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.timeStamp,
                                          id: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.id,
                                          sessionId: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.sessionId,
                                          role: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.role,
                                          isUser: MessageStruct.maybeFromMap(
                                                  currentLoop1Item)
                                              ?.isUser,
                                          isAssistant:
                                              MessageStruct.maybeFromMap(
                                                      currentLoop1Item)
                                                  ?.isAssistant,
                                          isPlaceholder: false,
                                        ));
                                        safeSetState(() {});
                                      }
                                      await Future.delayed(
                                        Duration(
                                          milliseconds: 150,
                                        ),
                                      );
                                      FFAppState().listVersion = 0;
                                      safeSetState(() {});
                                      FFAppState().listVersion =
                                          FFAppState().listVersion + 1;
                                      safeSetState(() {});
                                      FFAppState().isHydrating = false;
                                      safeSetState(() {});
                                      if (scaffoldKey
                                              .currentState!.isDrawerOpen ||
                                          scaffoldKey
                                              .currentState!.isEndDrawerOpen) {
                                        Navigator.pop(context);
                                      }

                                      context.pushNamed(
                                          MIDChatAICopyWidget.routeName);

                                      safeSetState(() {});
                                    },
                                    onDoubleTap: () async {},
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            child:
                                                custom_widgets.SwipeActionsItem(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              title: getJsonField(
                                                sessionuuItem,
                                                r'''$.title''',
                                              ).toString(),
                                              onDelete: () async {
                                                _model.apiResultDelete =
                                                    await DeleteChatSessionNewCall
                                                        .call(
                                                  userId: currentUserUid,
                                                  sessionId: getJsonField(
                                                    sessionuuItem,
                                                    r'''$.sessionId''',
                                                  ).toString(),
                                                );

                                                await Future.delayed(
                                                  Duration(
                                                    milliseconds: 200,
                                                  ),
                                                );
                                                _model.apiResultmu6 =
                                                    await DraverListViewCall
                                                        .call(
                                                  userId: currentUserUid,
                                                );

                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
        ),
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
              await CloseChatSessionExitCall.call(
                userId: currentUserUid,
                sessionId: FFAppState().activeSessionIdApp,
              );

              await Future.delayed(
                Duration(
                  milliseconds: 200,
                ),
              );
              await actions.clearMicText();

              context.pushNamed(GettingStartedWidget.routeName);
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              'dxy32g63' /* MID Chat */,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 45.0,
                fillColor: Color(0x0094B5D8),
                icon: Icon(
                  Icons.menu_open,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 16.0, 12.0),
                      child: Builder(
                        builder: (context) {
                          final message = FFAppState().chat.toList();

                          return ListView.builder(
                            key: ValueKey(
                                '${FFAppState().listVersion.toString()}${FFAppState().activeSessionIdApp}'),
                            padding: EdgeInsets.zero,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: message.length,
                            itemBuilder: (context, messageIndex) {
                              final messageItem = message[messageIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (messageItem.isAssistant == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 0.0),
                                                child: Text(
                                                  messageItem.text,
                                                  textAlign: TextAlign.start,
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
                                                        fontSize: 15.0,
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
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.favorite_sharp,
                                                  color: FFAppState()
                                                              .savedMessageIds
                                                              .contains(
                                                                  messageItem
                                                                      .text) ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent1
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  size: 14.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  _model.insights =
                                                      await OivalluksetCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    messageContent:
                                                        messageItem.text,
                                                    isImportant: true,
                                                    docId: getJsonField(
                                                      messageItem.toMap(),
                                                      r'''$.messages[:].id''',
                                                    ).toString(),
                                                    timestamp: dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      getCurrentTimestamp,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                  );

                                                  FFAppState()
                                                      .addToSavedMessageIds(
                                                          messageItem.text);
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (messageItem.isPlaceholder)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            messageItem.text,
                                            style: FlutterFlowTheme.of(context)
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
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (messageItem.isUser == true)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0x6194B5D8),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Text(
                                              messageItem.text,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 15.0,
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
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 12.0, 6.0, 12.0),
                  child: SafeArea(
                    maintainBottomViewPadding: true,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            child: TextFormField(
                              controller: _model
                                  .promptMessageUserControllerTextController,
                              focusNode:
                                  _model.promptMessageUserControllerFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.promptMessageUserControllerTextController',
                                Duration(milliseconds: 1000),
                                () async {
                                  FFAppState().micText = FFAppState().micText;
                                  safeSetState(() {});
                                  safeSetState(() {});
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: FFLocalizations.of(context).getText(
                                  'za55ar9v' /* Type here... */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDC3545),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDC3545),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context).accent4,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.openSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              minLines: 1,
                              maxLines: 8,
                              validator: _model
                                  .promptMessageUserControllerTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 48.0,
                                  icon: Icon(
                                    Icons.mic,
                                    color: FFAppState().isListening == true
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                  onPressed: () async {
                                    await requestPermission(
                                        microphonePermission);
                                    if (FFAppState().isListening == false) {
                                      _model.startToListen =
                                          await actions.startListeningAction(
                                        FFLocalizations.of(context)
                                            .languageCode,
                                      );
                                      FFAppState().micText =
                                          _model.startToListen!;
                                      safeSetState(() {});
                                      FFAppState().isListening = true;
                                      safeSetState(() {});
                                      safeSetState(() {});
                                    } else {
  // 🛑 Lopetetaan kuuntelu
  _model.stopListening = await actions.stopListeningAction();
  FFAppState().micText = _model.stopListening!;
  safeSetState(() {});
  await actions.updateTextFieldFromMic();
  FFAppState().isListening = false;
  safeSetState(() {});
  safeSetState(() {});

// 🧠 Päivitetään tekstikenttä heti puheen lopuksi
try {
  final controller = _model.promptMessageUserControllerTextController;
  if (controller != null) {
    controller.text = FFAppState().micText;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    await Future.delayed(const Duration(milliseconds: 30));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    });

    print('✅ Mic text updated directly: ${FFAppState().micText}');
  } else {
    print('⚠️ Controller not found.');
  }
} catch (e) {
  print('❌ Error updating textfield: $e');
}
}
safeSetState(() {});


                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 24.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 20,
                                    ),
                                  );
                                 if (_model.promptMessageUserControllerTextController.text != '') {
    // 💬 Haetaan käyttäjän viimeisin viesti
    FFAppState().latestAnswerUser =
        _model.promptMessageUserControllerTextController.text;
                                    safeSetState(() {});

                                    FFAppState().insertAtIndexInChat(
                                        0,
                                        MessageStruct(
                                          text: FFAppState().latestAnswerUser,
                                          role: '\"user\"',
                                          timeStamp: getCurrentTimestamp,
                                          id: getCurrentTimestamp.toString(),
                                          sessionId:
                                              FFAppState().activeSessionIdApp,
                                          isUser: true,
                                          isAssistant: false,
                                          isPlaceholder: false,
                                          docId: getCurrentTimestamp.toString(),
                                        ));
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Empty message',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 100,
                                    ),
                                  );
                                  if (FFAppState().hasUpdatedTitle == false) {
                                    _model.apiResultTitleUpdate =
                                        await TitleUpDateCall.call(
                                      userId: currentUserUid,
                                      sessionId:
                                          FFAppState().activeSessionIdApp,
                                      message: FFAppState().latestAnswerUser,
                                    );

                                    FFAppState().titleUpdate = getJsonField(
                                      (_model.apiResultTitleUpdate?.jsonBody ??
                                          ''),
                                      r'''$.title''',
                                    ).toString();
                                    safeSetState(() {});
                                    FFAppState().hasUpdatedTitle = true;
                                    safeSetState(() {});
                                  }
                                  safeSetState(() {
                                    _model
                                        .promptMessageUserControllerTextController
                                        ?.clear();
                                  });
                                  _previousSessionText = ''; // palautettu vanhasta versiosta
                                  FFAppState().micText = '\"\"';
                                  safeSetState(() {});
                                  _model.emptyMessage =
                                      await CreateAssistantMessageStreamCall
                                          .call(
                                    userId: currentUserUid,
                                    sessionId: FFAppState().activeSessionIdApp,
                                  );

                                  FFAppState().testId = getJsonField(
                                    (_model.emptyMessage?.jsonBody ?? ''),
                                    r'''$.id''',
                                  ).toString();
                                  safeSetState(() {});
                                  FFAppState().insertAtIndexInChat(
                                      0,
                                      MessageStruct(
                                        text: 'Processing....',
                                        role: '\"placeholder\"',
                                        timeStamp: getCurrentTimestamp,
                                        id: FFAppState().testId,
                                        sessionId:
                                            FFAppState().activeSessionIdApp,
                                        isPlaceholder: true,
                                        isUser: false,
                                        isAssistant: false,
                                        docId: getCurrentTimestamp.toString(),
                                      ));
                                  safeSetState(() {});
                                  _model.chatMidOutput = await MidChatCall.call(
                                    userId: currentUserUid,
                                    sessionId: FFAppState().activeSessionIdApp,
                                    message: FFAppState().latestAnswerUser,
                                    history: FFAppState().chatMemoryContext,
                                    summary: FFAppState().chatSummary12,
                                  );

                                  FFAppState().latestAssistantText =
                                      getJsonField(
                                    (_model.chatMidOutput?.jsonBody ?? ''),
                                    r'''$.messages[-1].text''',
                                  ).toString();
                                  safeSetState(() {});
                                  FFAppState().updateChatAtIndex(
                                    0,
                                    (_) => MessageStruct(
                                      text: FFAppState().latestAssistantText,
                                      role: '\"assistant\"',
                                      timeStamp: getCurrentTimestamp,
                                      id: FFAppState().testId,
                                      sessionId:
                                          FFAppState().activeSessionIdApp,
                                      isAssistant: true,
                                      isUser: false,
                                      isPlaceholder: false,
                                      docId: MessageStruct.maybeFromMap(
                                          getJsonField(
                                        (_model.chatMidOutput?.jsonBody ?? ''),
                                        r'''$.messages[:].id''',
                                      ))?.docId,
                                    ),
                                  );
                                  safeSetState(() {});
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 200,
                                    ),
                                  );
                                  _model.rollingSummary =
                                      await GenerateChatSummaryRollingCall.call(
                                    userId: currentUserUid,
                                    sessionId: FFAppState().activeSessionIdApp,
                                  );

                                  FFAppState().chatSummary12 = getJsonField(
                                    (_model.rollingSummary?.jsonBody ?? ''),
                                    r'''$.summary''',
                                  ).toString();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
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
          ),
        ),
      ),
    );
  }
}
