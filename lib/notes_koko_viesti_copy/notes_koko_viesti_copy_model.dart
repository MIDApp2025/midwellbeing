import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notes_koko_viesti_copy_widget.dart' show NotesKokoViestiCopyWidget;
import 'package:flutter/material.dart';

class NotesKokoViestiCopyModel
    extends FlutterFlowModel<NotesKokoViestiCopyWidget> {
  ///  Local state fields for this page.

  String? editedNoteContent;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (updateNote)] action in TextNoteInputField widget.
  ApiCallResponse? apiResultUpdate;
  // Stores action output result for [Backend Call - API (deleteNotes)] action in Button widget.
  ApiCallResponse? apiResultDeletSheet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
