import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notes_koko_viesti_widget.dart' show NotesKokoViestiWidget;
import 'package:flutter/material.dart';

class NotesKokoViestiModel extends FlutterFlowModel<NotesKokoViestiWidget> {
  ///  Local state fields for this page.

  String? editedNoteContent;

  String? updatedAt;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (updateNote)] action in TextNoteInputField widget.
  ApiCallResponse? apiResultUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
