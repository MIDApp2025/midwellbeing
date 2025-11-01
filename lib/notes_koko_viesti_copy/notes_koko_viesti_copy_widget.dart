import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notes_koko_viesti_copy_model.dart';
export 'notes_koko_viesti_copy_model.dart';

class NotesKokoViestiCopyWidget extends StatefulWidget {
  const NotesKokoViestiCopyWidget({
    super.key,
    required this.date,
    required this.message,
    required this.notesItem,
    required this.noteId,
  });

  final String? date;
  final String? message;
  final dynamic notesItem;
  final String? noteId;

  static String routeName = 'NotesKokoViestiCopy';
  static String routePath = '/notesKokoViestiCopy';

  @override
  State<NotesKokoViestiCopyWidget> createState() =>
      _NotesKokoViestiCopyWidgetState();
}

class _NotesKokoViestiCopyWidgetState extends State<NotesKokoViestiCopyWidget> {
  late NotesKokoViestiCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesKokoViestiCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.editedNoteContent = widget.message;
      safeSetState(() {});
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
              context.pushNamed(InsightsWidget.routeName);
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '2fb8w2c2' /* MID saved Notes */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
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
            children: [
              Align(
  alignment: AlignmentDirectional(-1.0, 0.0),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 8.0),
    child: Builder(
      builder: (context) {
        final raw = widget.date;
        String formattedDate = '–';

        if (raw != null && raw.isNotEmpty) {
          try {
            final parts = raw.split(' ');
            final date = parts[0].split('.');
            final time = parts[1].split(':');

            // 🔹 Backend antaa UTC-ajan → lisätään +2h Suomen aikavyöhykkeen vuoksi
            var dt = DateTime.utc(
              int.parse(date[2]),
              int.parse(date[1]),
              int.parse(date[0]),
              int.parse(time[0]),
              int.parse(time[1]),
            ).add(const Duration(hours: 2));

            formattedDate = dateTimeFormat('dd.MM.yyyy HH:mm', dt);
          } catch (e) {
            print('Virhe aikamuunnoksessa: $e');
            formattedDate = raw;
          }
        }

        return Text(
          formattedDate,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                letterSpacing: 0.0,
              ),
        );
      },
    ),
  ),
),


         
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: custom_widgets.TextNoteInputField(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    initialValue: widget.message!,
                    onValueChanged: (newValue) async {
                      _model.editedNoteContent = newValue;
                      safeSetState(() {});
                    },
                    onSavePressed: () async {
                      _model.apiResultUpdate = await UpdateNoteCall.call(
                        userId: currentUserUid,
                        noteId: widget.noteId,
                        note: _model.editedNoteContent,
                      );

                      await Future.delayed(
                        Duration(
                          milliseconds: 300,
                        ),
                      );
                      Navigator.pop(context);

                      safeSetState(() {});
                    },
                    onBackPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 16.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Delete this insight?'),
                                          content: Text(
                                              'This action cannot be undone'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  _model.apiResultDeletSheet =
                                      await DeleteNotesCall.call(
                                    userId: currentUserUid,
                                    docId: getJsonField(
                                      widget.notesItem,
                                      r'''$.id''',
                                    ).toString(),
                                  );

                                  context.pushNamed(InsightsWidget.routeName);
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'opwjvzft' /* Delete Note */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent4,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).accent1,
                                hoverTextColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {},
                              text: FFLocalizations.of(context).getText(
                                '2aizrxev' /* Ok */,
                              ),
                              options: FFButtonOptions(
                                width: 80.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).accent2,
                                hoverTextColor: Colors.white,
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 2.0))
                            .around(SizedBox(width: 2.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
