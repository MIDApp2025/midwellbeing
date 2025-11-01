// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatContextRollingStruct extends FFFirebaseStruct {
  ChatContextRollingStruct({
    String? summary,
    bool? updated,
    int? newCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _summary = summary,
        _updated = updated,
        _newCount = newCount,
        super(firestoreUtilData);

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "updated" field.
  bool? _updated;
  bool get updated => _updated ?? false;
  set updated(bool? val) => _updated = val;

  bool hasUpdated() => _updated != null;

  // "newCount" field.
  int? _newCount;
  int get newCount => _newCount ?? 0;
  set newCount(int? val) => _newCount = val;

  void incrementNewCount(int amount) => newCount = newCount + amount;

  bool hasNewCount() => _newCount != null;

  static ChatContextRollingStruct fromMap(Map<String, dynamic> data) =>
      ChatContextRollingStruct(
        summary: data['summary'] as String?,
        updated: data['updated'] as bool?,
        newCount: castToType<int>(data['newCount']),
      );

  static ChatContextRollingStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatContextRollingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'summary': _summary,
        'updated': _updated,
        'newCount': _newCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.bool,
        ),
        'newCount': serializeParam(
          _newCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChatContextRollingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatContextRollingStruct(
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.bool,
          false,
        ),
        newCount: deserializeParam(
          data['newCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChatContextRollingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatContextRollingStruct &&
        summary == other.summary &&
        updated == other.updated &&
        newCount == other.newCount;
  }

  @override
  int get hashCode => const ListEquality().hash([summary, updated, newCount]);
}

ChatContextRollingStruct createChatContextRollingStruct({
  String? summary,
  bool? updated,
  int? newCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatContextRollingStruct(
      summary: summary,
      updated: updated,
      newCount: newCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatContextRollingStruct? updateChatContextRollingStruct(
  ChatContextRollingStruct? chatContextRolling, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatContextRolling
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatContextRollingStructData(
  Map<String, dynamic> firestoreData,
  ChatContextRollingStruct? chatContextRolling,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatContextRolling == null) {
    return;
  }
  if (chatContextRolling.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatContextRolling.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatContextRollingData =
      getChatContextRollingFirestoreData(chatContextRolling, forFieldValue);
  final nestedData =
      chatContextRollingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      chatContextRolling.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatContextRollingFirestoreData(
  ChatContextRollingStruct? chatContextRolling, [
  bool forFieldValue = false,
]) {
  if (chatContextRolling == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatContextRolling.toMap());

  // Add any Firestore field values
  chatContextRolling.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatContextRollingListFirestoreData(
  List<ChatContextRollingStruct>? chatContextRollings,
) =>
    chatContextRollings
        ?.map((e) => getChatContextRollingFirestoreData(e, true))
        .toList() ??
    [];
