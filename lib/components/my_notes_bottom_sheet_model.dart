import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_notes_bottom_sheet_widget.dart' show MyNotesBottomSheetWidget;
import 'package:flutter/material.dart';

class MyNotesBottomSheetModel
    extends FlutterFlowModel<MyNotesBottomSheetWidget> {
  ///  Local state fields for this component.

  String? photoUrl;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getUserPhoto)] action in MyNotesBottomSheet widget.
  ApiCallResponse? apiResultPhoto;
  // State field(s) for yourNotesField widget.
  FocusNode? yourNotesFieldFocusNode;
  TextEditingController? yourNotesFieldTextController;
  String? Function(BuildContext, String?)?
      yourNotesFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (addNote)] action in Button widget.
  ApiCallResponse? addNote;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNotesFieldFocusNode?.dispose();
    yourNotesFieldTextController?.dispose();
  }
}
