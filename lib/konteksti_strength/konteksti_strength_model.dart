import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'konteksti_strength_widget.dart' show KontekstiStrengthWidget;
import 'package:flutter/material.dart';

class KontekstiStrengthModel extends FlutterFlowModel<KontekstiStrengthWidget> {
  ///  Local state fields for this page.

  String? selectedContext;

  String? customContext;

  bool? showCustomField;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (submitTapEntryVercelStrength )] action in Button widget.
  ApiCallResponse? apiResult0tb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
