import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'confidence_test_page_widget.dart' show ConfidenceTestPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
