import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kontekstibelonging_widget.dart' show KontekstibelongingWidget;
import 'package:flutter/material.dart';

class KontekstibelongingModel
    extends FlutterFlowModel<KontekstibelongingWidget> {
  ///  Local state fields for this page.

  String? selectedContext;

  String? customContext;

  bool? customTextField;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (submitTapEntryVercelBelonging )] action in Button widget.
  ApiCallResponse? apiResultt1x;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
