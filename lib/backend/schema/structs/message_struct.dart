// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends FFFirebaseStruct {
  MessageStruct({
    String? text,
    String? role,
    DateTime? timeStamp,
    String? id,
    String? sessionId,
    bool? isUser,
    bool? isAssistant,
    bool? isPlaceholder,
    String? docId,
    bool? isImportant,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _role = role,
        _timeStamp = timeStamp,
        _id = id,
        _sessionId = sessionId,
        _isUser = isUser,
        _isAssistant = isAssistant,
        _isPlaceholder = isPlaceholder,
        _docId = docId,
        _isImportant = isImportant,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;

  bool hasTimeStamp() => _timeStamp != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "isUser" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  set isUser(bool? val) => _isUser = val;

  bool hasIsUser() => _isUser != null;

  // "isAssistant" field.
  bool? _isAssistant;
  bool get isAssistant => _isAssistant ?? false;
  set isAssistant(bool? val) => _isAssistant = val;

  bool hasIsAssistant() => _isAssistant != null;

  // "isPlaceholder" field.
  bool? _isPlaceholder;
  bool get isPlaceholder => _isPlaceholder ?? false;
  set isPlaceholder(bool? val) => _isPlaceholder = val;

  bool hasIsPlaceholder() => _isPlaceholder != null;

  // "docId" field.
  String? _docId;
  String get docId => _docId ?? '';
  set docId(String? val) => _docId = val;

  bool hasDocId() => _docId != null;

  // "is_important" field.
  bool? _isImportant;
  bool get isImportant => _isImportant ?? false;
  set isImportant(bool? val) => _isImportant = val;

  bool hasIsImportant() => _isImportant != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        text: data['text'] as String?,
        role: data['role'] as String?,
        timeStamp: data['timeStamp'] as DateTime?,
        id: data['id'] as String?,
        sessionId: data['sessionId'] as String?,
        isUser: data['isUser'] as bool?,
        isAssistant: data['isAssistant'] as bool?,
        isPlaceholder: data['isPlaceholder'] as bool?,
        docId: data['docId'] as String?,
        isImportant: data['is_important'] as bool?,
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'role': _role,
        'timeStamp': _timeStamp,
        'id': _id,
        'sessionId': _sessionId,
        'isUser': _isUser,
        'isAssistant': _isAssistant,
        'isPlaceholder': _isPlaceholder,
        'docId': _docId,
        'is_important': _isImportant,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'timeStamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'sessionId': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'isUser': serializeParam(
          _isUser,
          ParamType.bool,
        ),
        'isAssistant': serializeParam(
          _isAssistant,
          ParamType.bool,
        ),
        'isPlaceholder': serializeParam(
          _isPlaceholder,
          ParamType.bool,
        ),
        'docId': serializeParam(
          _docId,
          ParamType.String,
        ),
        'is_important': serializeParam(
          _isImportant,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        timeStamp: deserializeParam(
          data['timeStamp'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        sessionId: deserializeParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        isUser: deserializeParam(
          data['isUser'],
          ParamType.bool,
          false,
        ),
        isAssistant: deserializeParam(
          data['isAssistant'],
          ParamType.bool,
          false,
        ),
        isPlaceholder: deserializeParam(
          data['isPlaceholder'],
          ParamType.bool,
          false,
        ),
        docId: deserializeParam(
          data['docId'],
          ParamType.String,
          false,
        ),
        isImportant: deserializeParam(
          data['is_important'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStruct &&
        text == other.text &&
        role == other.role &&
        timeStamp == other.timeStamp &&
        id == other.id &&
        sessionId == other.sessionId &&
        isUser == other.isUser &&
        isAssistant == other.isAssistant &&
        isPlaceholder == other.isPlaceholder &&
        docId == other.docId &&
        isImportant == other.isImportant;
  }

  @override
  int get hashCode => const ListEquality().hash([
        text,
        role,
        timeStamp,
        id,
        sessionId,
        isUser,
        isAssistant,
        isPlaceholder,
        docId,
        isImportant
      ]);
}

MessageStruct createMessageStruct({
  String? text,
  String? role,
  DateTime? timeStamp,
  String? id,
  String? sessionId,
  bool? isUser,
  bool? isAssistant,
  bool? isPlaceholder,
  String? docId,
  bool? isImportant,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageStruct(
      text: text,
      role: role,
      timeStamp: timeStamp,
      id: id,
      sessionId: sessionId,
      isUser: isUser,
      isAssistant: isAssistant,
      isPlaceholder: isPlaceholder,
      docId: docId,
      isImportant: isImportant,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageStruct? updateMessageStruct(
  MessageStruct? message, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    message
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageStructData(
  Map<String, dynamic> firestoreData,
  MessageStruct? message,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (message == null) {
    return;
  }
  if (message.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && message.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageData = getMessageFirestoreData(message, forFieldValue);
  final nestedData = messageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = message.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageFirestoreData(
  MessageStruct? message, [
  bool forFieldValue = false,
]) {
  if (message == null) {
    return {};
  }
  final firestoreData = mapToFirestore(message.toMap());

  // Add any Firestore field values
  message.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageListFirestoreData(
  List<MessageStruct>? messages,
) =>
    messages?.map((e) => getMessageFirestoreData(e, true)).toList() ?? [];
