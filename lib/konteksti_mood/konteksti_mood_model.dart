import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'konteksti_mood_widget.dart' show KontekstiMoodWidget;
import 'package:flutter/material.dart';

class KontekstiMoodModel extends FlutterFlowModel<KontekstiMoodWidget> {
  ///  Local state fields for this page.

  String? selectedContext;

  bool? customContextField;

  String? customContext;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (submitTapEntryVercelMood)] action in Button widget.
  ApiCallResponse? apiResultt1x;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
