import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notes_koko_viesti_model.dart';
export 'notes_koko_viesti_model.dart';

class NotesKokoViestiWidget extends StatefulWidget {
  const NotesKokoViestiWidget({
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

  static String routeName = 'NotesKokoViesti';
  static String routePath = '/notesKokoViesti';

  @override
  State<NotesKokoViestiWidget> createState() => _NotesKokoViestiWidgetState();
}

class _NotesKokoViestiWidgetState extends State<NotesKokoViestiWidget> {
  late NotesKokoViestiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesKokoViestiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.editedNoteContent = widget.message;
      safeSetState(() {});
      _model.updatedAt = '';
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
    context.watch<FFAppState>();

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
          title: Text(
            FFLocalizations.of(context).getText(
              'suf65101' /* MID saved Notes */,
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
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
  alignment: AlignmentDirectional(-1.0, 0.0),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 0.0, 0.0),
    child: RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(
        children: [
          TextSpan(
            text: FFLocalizations.of(context).getText(
              'gluzoluh' /* Original:   */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .fontStyle,
                  ),
                  letterSpacing: 0.0,
                ),
          ),
          TextSpan(
            text: (() {
              final raw = widget.date;
              if (raw == null || raw.isEmpty) {
                return '–';
              }

              try {
                final parts = raw.split(' ');
                final date = parts[0].split('.');
                final time = parts[1].split(':');

                final dt = DateTime.utc(
                  int.parse(date[2]),
                  int.parse(date[1]),
                  int.parse(date[0]),
                  int.parse(time[0]),
                  int.parse(time[1]),
                ).add(const Duration(hours: 2));

                return dateTimeFormat('dd.MM.yyyy HH:mm', dt);
              } catch (e) {
                print('Virhe aikamuunnoksessa: $e');
                return raw;
              }
            })(),
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
                ),
          ),
        ],
      ),
    ),
  ),
),

                  
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: custom_widgets.TextNoteInputField(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        initialValue: widget.message!,
                        onValueChanged: (newValue) async {
                          _model.editedNoteContent = newValue;
                          safeSetState(() {});
                        },
                        onSavePressed: () async {
                          _model.updatedAt = dateTimeFormat(
                            "M/d h:mm a",
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          );
                          safeSetState(() {});
                          _model.apiResultUpdate = await UpdateNoteCall.call(
                            userId: currentUserUid,
                            noteId: widget.noteId,
                            note: _model.editedNoteContent,
                            updatedAt: _model.updatedAt,
                          );

                          await Future.delayed(
                            Duration(
                              milliseconds: 300,
                            ),
                          );
                          FFAppState().updatetAtNote =
                              (_model.apiResultUpdate?.jsonBody ?? '')
                                  .toString();
                          safeSetState(() {});

                          context.pushNamed(
                            InsightsWidget.routeName,
                            queryParameters: {
                              'updatedAt': serializeParam(
                                FFAppState().updatetAtNote,
                                ParamType.String,
                              ),
                            }.withoutNulls,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
