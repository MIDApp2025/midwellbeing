// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatContextResponseStruct extends FFFirebaseStruct {
  ChatContextResponseStruct({
    String? history,
    List<String>? summaries,
    bool? hasHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _history = history,
        _summaries = summaries,
        _hasHistory = hasHistory,
        super(firestoreUtilData);

  // "history" field.
  String? _history;
  String get history => _history ?? '';
  set history(String? val) => _history = val;

  bool hasHistoryField() => _history != null;

  // "summaries" field.
  List<String>? _summaries;
  List<String> get summaries => _summaries ?? const [];
  set summaries(List<String>? val) => _summaries = val;

  void updateSummaries(Function(List<String>) updateFn) {
    updateFn(_summaries ??= []);
  }

  bool hasSummaries() => _summaries != null;

  // "hasHistory" field.
  bool? _hasHistory;
  bool get hasHistory => _hasHistory ?? false;
  set hasHistory(bool? val) => _hasHistory = val;

  bool hasHasHistory() => _hasHistory != null;

  static ChatContextResponseStruct fromMap(Map<String, dynamic> data) =>
      ChatContextResponseStruct(
        history: data['history'] as String?,
        summaries: getDataList(data['summaries']),
        hasHistory: data['hasHistory'] as bool?,
      );

  static ChatContextResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatContextResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'history': _history,
        'summaries': _summaries,
        'hasHistory': _hasHistory,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'history': serializeParam(
          _history,
          ParamType.String,
        ),
        'summaries': serializeParam(
          _summaries,
          ParamType.String,
          isList: true,
        ),
        'hasHistory': serializeParam(
          _hasHistory,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatContextResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatContextResponseStruct(
        history: deserializeParam(
          data['history'],
          ParamType.String,
          false,
        ),
        summaries: deserializeParam<String>(
          data['summaries'],
          ParamType.String,
          true,
        ),
        hasHistory: deserializeParam(
          data['hasHistory'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatContextResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatContextResponseStruct &&
        history == other.history &&
        listEquality.equals(summaries, other.summaries) &&
        hasHistory == other.hasHistory;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([history, summaries, hasHistory]);
}

ChatContextResponseStruct createChatContextResponseStruct({
  String? history,
  bool? hasHistory,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatContextResponseStruct(
      history: history,
      hasHistory: hasHistory,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatContextResponseStruct? updateChatContextResponseStruct(
  ChatContextResponseStruct? chatContextResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatContextResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatContextResponseStructData(
  Map<String, dynamic> firestoreData,
  ChatContextResponseStruct? chatContextResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatContextResponse == null) {
    return;
  }
  if (chatContextResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatContextResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatContextResponseData =
      getChatContextResponseFirestoreData(chatContextResponse, forFieldValue);
  final nestedData =
      chatContextResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      chatContextResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatContextResponseFirestoreData(
  ChatContextResponseStruct? chatContextResponse, [
  bool forFieldValue = false,
]) {
  if (chatContextResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatContextResponse.toMap());

  // Add any Firestore field values
  chatContextResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatContextResponseListFirestoreData(
  List<ChatContextResponseStruct>? chatContextResponses,
) =>
    chatContextResponses
        ?.map((e) => getChatContextResponseFirestoreData(e, true))
        .toList() ??
    [];
