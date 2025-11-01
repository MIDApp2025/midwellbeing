import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'konteksti_confidence_new_widget.dart' show KontekstiConfidenceNewWidget;
import 'package:flutter/material.dart';

class KontekstiConfidenceNewModel
    extends FlutterFlowModel<KontekstiConfidenceNewWidget> {
  ///  Local state fields for this page.

  String? selectedContext;

  String? customContext;

  bool? contextTextField;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (submitTapEntryVercelConfidence)] action in Button widget.
  ApiCallResponse? apiResultmop;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
