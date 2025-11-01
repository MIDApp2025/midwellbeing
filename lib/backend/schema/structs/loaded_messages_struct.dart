// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LoadedMessagesStruct extends FFFirebaseStruct {
  LoadedMessagesStruct({
    String? role,
    String? text,
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _role = role,
        _text = text,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static LoadedMessagesStruct fromMap(Map<String, dynamic> data) =>
      LoadedMessagesStruct(
        role: data['role'] as String?,
        text: data['text'] as String?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static LoadedMessagesStruct? maybeFromMap(dynamic data) => data is Map
      ? LoadedMessagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'text': _text,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static LoadedMessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoadedMessagesStruct(
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'LoadedMessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoadedMessagesStruct &&
        role == other.role &&
        text == other.text &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([role, text, timestamp]);
}

LoadedMessagesStruct createLoadedMessagesStruct({
  String? role,
  String? text,
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoadedMessagesStruct(
      role: role,
      text: text,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoadedMessagesStruct? updateLoadedMessagesStruct(
  LoadedMessagesStruct? loadedMessages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loadedMessages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoadedMessagesStructData(
  Map<String, dynamic> firestoreData,
  LoadedMessagesStruct? loadedMessages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loadedMessages == null) {
    return;
  }
  if (loadedMessages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && loadedMessages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loadedMessagesData =
      getLoadedMessagesFirestoreData(loadedMessages, forFieldValue);
  final nestedData =
      loadedMessagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = loadedMessages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoadedMessagesFirestoreData(
  LoadedMessagesStruct? loadedMessages, [
  bool forFieldValue = false,
]) {
  if (loadedMessages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loadedMessages.toMap());

  // Add any Firestore field values
  loadedMessages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoadedMessagesListFirestoreData(
  List<LoadedMessagesStruct>? loadedMessagess,
) =>
    loadedMessagess
        ?.map((e) => getLoadedMessagesFirestoreData(e, true))
        .toList() ??
    [];
