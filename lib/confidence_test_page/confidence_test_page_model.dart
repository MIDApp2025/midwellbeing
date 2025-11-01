import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confidence_test_page_widget.dart' show ConfidenceTestPageWidget;
import 'package:flutter/material.dart';

class ConfidenceTestPageModel
    extends FlutterFlowModel<ConfidenceTestPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> testMessages = [];
  void addToTestMessages(dynamic item) => testMessages.add(item);
  void removeFromTestMessages(dynamic item) => testMessages.remove(item);
  void removeAtIndexFromTestMessages(int index) => testMessages.removeAt(index);
  void insertAtIndexInTestMessages(int index, dynamic item) =>
      testMessages.insert(index, item);
  void updateTestMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      testMessages[index] = updateFn(testMessages[index]);

  String? textEditingControllelCC;

  String? userMessageTemp;

  /// ""
  String role = '\"\"';

  String content = '\"\"';

  int? nextQuestion;

  bool showInitialText = true;

  bool showUserAnswer = false;

  String? sessionId;

  String? latestUserAnswer;

  bool? isCcompleted = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldUserCCCC widget.
  FocusNode? textFieldUserCCCCFocusNode;
  TextEditingController? textFieldUserCCCCTextController;
  String? Function(BuildContext, String?)?
      textFieldUserCCCCTextControllerValidator;
  // Stores action output result for [Backend Call - API (getTestQuestions)] action in IconButton widget.
  ApiCallResponse? apiButtonMessage;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldUserCCCCFocusNode?.dispose();
    textFieldUserCCCCTextController?.dispose();

    navBarModel.dispose();
  }
}
