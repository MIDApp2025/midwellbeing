// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatSessionsStruct extends FFFirebaseStruct {
  ChatSessionsStruct({
    String? userId,
    String? title,
    String? sessions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _title = title,
        _sessions = sessions,
        super(firestoreUtilData);

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "sessions" field.
  String? _sessions;
  String get sessions => _sessions ?? '';
  set sessions(String? val) => _sessions = val;

  bool hasSessions() => _sessions != null;

  static ChatSessionsStruct fromMap(Map<String, dynamic> data) =>
      ChatSessionsStruct(
        userId: data['userId'] as String?,
        title: data['title'] as String?,
        sessions: data['sessions'] as String?,
      );

  static ChatSessionsStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatSessionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'title': _title,
        'sessions': _sessions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'sessions': serializeParam(
          _sessions,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatSessionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatSessionsStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        sessions: deserializeParam(
          data['sessions'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatSessionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatSessionsStruct &&
        userId == other.userId &&
        title == other.title &&
        sessions == other.sessions;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, title, sessions]);
}

ChatSessionsStruct createChatSessionsStruct({
  String? userId,
  String? title,
  String? sessions,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatSessionsStruct(
      userId: userId,
      title: title,
      sessions: sessions,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatSessionsStruct? updateChatSessionsStruct(
  ChatSessionsStruct? chatSessions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatSessions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatSessionsStructData(
  Map<String, dynamic> firestoreData,
  ChatSessionsStruct? chatSessions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatSessions == null) {
    return;
  }
  if (chatSessions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatSessions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatSessionsData =
      getChatSessionsFirestoreData(chatSessions, forFieldValue);
  final nestedData =
      chatSessionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatSessions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatSessionsFirestoreData(
  ChatSessionsStruct? chatSessions, [
  bool forFieldValue = false,
]) {
  if (chatSessions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatSessions.toMap());

  // Add any Firestore field values
  chatSessions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatSessionsListFirestoreData(
  List<ChatSessionsStruct>? chatSessionss,
) =>
    chatSessionss?.map((e) => getChatSessionsFirestoreData(e, true)).toList() ??
    [];
