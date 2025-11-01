import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'm_i_d_chat_a_i_copy_widget.dart' show MIDChatAICopyWidget;
import 'package:flutter/material.dart';

class MIDChatAICopyModel extends FlutterFlowModel<MIDChatAICopyWidget> {
  ///  Local state fields for this page.

  List<dynamic> chatMessages = [];
  void addToChatMessages(dynamic item) => chatMessages.add(item);
  void removeFromChatMessages(dynamic item) => chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, dynamic item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  String? userMessage;

  List<dynamic> midChatResponsePageState = [];
  void addToMidChatResponsePageState(dynamic item) =>
      midChatResponsePageState.add(item);
  void removeFromMidChatResponsePageState(dynamic item) =>
      midChatResponsePageState.remove(item);
  void removeAtIndexFromMidChatResponsePageState(int index) =>
      midChatResponsePageState.removeAt(index);
  void insertAtIndexInMidChatResponsePageState(int index, dynamic item) =>
      midChatResponsePageState.insert(index, item);
  void updateMidChatResponsePageStateAtIndex(
          int index, Function(dynamic) updateFn) =>
      midChatResponsePageState[index] =
          updateFn(midChatResponsePageState[index]);

  String? prompt;

  FFUploadedFile? audioFile;

  bool isRecording = false;

  MessageStruct? lastMessagePair;
  void updateLastMessagePairStruct(Function(MessageStruct) updateFn) {
    updateFn(lastMessagePair ??= MessageStruct());
  }

  String? selectedSessionID;

  List<dynamic> loadedMessages = [];
  void addToLoadedMessages(dynamic item) => loadedMessages.add(item);
  void removeFromLoadedMessages(dynamic item) => loadedMessages.remove(item);
  void removeAtIndexFromLoadedMessages(int index) =>
      loadedMessages.removeAt(index);
  void insertAtIndexInLoadedMessages(int index, dynamic item) =>
      loadedMessages.insert(index, item);
  void updateLoadedMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      loadedMessages[index] = updateFn(loadedMessages[index]);

  List<dynamic> finalMessages = [];
  void addToFinalMessages(dynamic item) => finalMessages.add(item);
  void removeFromFinalMessages(dynamic item) => finalMessages.remove(item);
  void removeAtIndexFromFinalMessages(int index) =>
      finalMessages.removeAt(index);
  void insertAtIndexInFinalMessages(int index, dynamic item) =>
      finalMessages.insert(index, item);
  void updateFinalMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      finalMessages[index] = updateFn(finalMessages[index]);

  List<MessageStruct> chatNew = [];
  void addToChatNew(MessageStruct item) => chatNew.add(item);
  void removeFromChatNew(MessageStruct item) => chatNew.remove(item);
  void removeAtIndexFromChatNew(int index) => chatNew.removeAt(index);
  void insertAtIndexInChatNew(int index, MessageStruct item) =>
      chatNew.insert(index, item);
  void updateChatNewAtIndex(int index, Function(MessageStruct) updateFn) =>
      chatNew[index] = updateFn(chatNew[index]);

  String? sessionSource;

  List<dynamic> apiData = [];
  void addToApiData(dynamic item) => apiData.add(item);
  void removeFromApiData(dynamic item) => apiData.remove(item);
  void removeAtIndexFromApiData(int index) => apiData.removeAt(index);
  void insertAtIndexInApiData(int index, dynamic item) =>
      apiData.insert(index, item);
  void updateApiDataAtIndex(int index, Function(dynamic) updateFn) =>
      apiData[index] = updateFn(apiData[index]);

  bool? fromHistory;

  List<dynamic> chatSessionsDraver = [];
  void addToChatSessionsDraver(dynamic item) => chatSessionsDraver.add(item);
  void removeFromChatSessionsDraver(dynamic item) =>
      chatSessionsDraver.remove(item);
  void removeAtIndexFromChatSessionsDraver(int index) =>
      chatSessionsDraver.removeAt(index);
  void insertAtIndexInChatSessionsDraver(int index, dynamic item) =>
      chatSessionsDraver.insert(index, item);
  void updateChatSessionsDraverAtIndex(int index, Function(dynamic) updateFn) =>
      chatSessionsDraver[index] = updateFn(chatSessionsDraver[index]);

  List<dynamic> chatSessionListReady = [];
  void addToChatSessionListReady(dynamic item) =>
      chatSessionListReady.add(item);
  void removeFromChatSessionListReady(dynamic item) =>
      chatSessionListReady.remove(item);
  void removeAtIndexFromChatSessionListReady(int index) =>
      chatSessionListReady.removeAt(index);
  void insertAtIndexInChatSessionListReady(int index, dynamic item) =>
      chatSessionListReady.insert(index, item);
  void updateChatSessionListReadyAtIndex(
          int index, Function(dynamic) updateFn) =>
      chatSessionListReady[index] = updateFn(chatSessionListReady[index]);

  bool? isSaved;

  String? tempUuid;
  
  String? querySearch;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (luoSessionIdCreateChatSession)] action in MIDChatAICopy widget.
  ApiCallResponse? apiResultPageLoadUUid;
  // Stores action output result for [Backend Call - API (ChatContextLatestAndArchive)] action in MIDChatAICopy widget.
  ApiCallResponse? apiResultPageLoad;
  // Stores action output result for [Backend Call - API (oivallukset)] action in IconButton widget.
  ApiCallResponse? insights;
  // State field(s) for promptMessageUserController widget.
  FocusNode? promptMessageUserControllerFocusNode;
  TextEditingController? promptMessageUserControllerTextController;
  String? Function(BuildContext, String?)?
      promptMessageUserControllerTextControllerValidator;
  // Stores action output result for [Custom Action - startListeningAction] action in IconButton widget.
  String? startToListen;
  // Stores action output result for [Custom Action - stopListeningAction] action in IconButton widget.
  String? stopListening;
  // Stores action output result for [Backend Call - API (titleUpDate)] action in IconButton widget.
  ApiCallResponse? apiResultTitleUpdate;
  // Stores action output result for [Backend Call - API (createAssistantMessageStream)] action in IconButton widget.
  ApiCallResponse? emptyMessage;
  // Stores action output result for [Backend Call - API (MidChat)] action in IconButton widget.
  ApiCallResponse? chatMidOutput;
  // Stores action output result for [Backend Call - API (generateChatSummaryRolling)] action in IconButton widget.
  ApiCallResponse? rollingSummary;
  // Stores action output result for [Backend Call - API (getSessionMessages)] action in Container widget.
  FocusNode? queryFieldFocusNode;
  TextEditingController? queryFieldTextController;
  String? Function(BuildContext, String?)? queryFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSessionMessages)] action in Container widget.
  ApiCallResponse? getSessionMessages;
  // Stores action output result for [Backend Call - API (deleteChatSessionNew)] action in SwipeActionsItem widget.
  ApiCallResponse? apiResultDelete;
  // Stores action output result for [Backend Call - API (draverListView)] action in SwipeActionsItem widget.
  ApiCallResponse? apiResultmu6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptMessageUserControllerFocusNode?.dispose();
    promptMessageUserControllerTextController?.dispose();

    queryFieldFocusNode?.dispose();
    queryFieldTextController?.dispose();
  }
}
