// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GetUserNotesStruct extends FFFirebaseStruct {
  GetUserNotesStruct({
    String? notes,
    DateTime? dateTimw,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notes = notes,
        _dateTimw = dateTimw,
        super(firestoreUtilData);

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "dateTimw" field.
  DateTime? _dateTimw;
  DateTime? get dateTimw => _dateTimw;
  set dateTimw(DateTime? val) => _dateTimw = val;

  bool hasDateTimw() => _dateTimw != null;

  static GetUserNotesStruct fromMap(Map<String, dynamic> data) =>
      GetUserNotesStruct(
        notes: data['notes'] as String?,
        dateTimw: data['dateTimw'] as DateTime?,
      );

  static GetUserNotesStruct? maybeFromMap(dynamic data) => data is Map
      ? GetUserNotesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notes': _notes,
        'dateTimw': _dateTimw,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'dateTimw': serializeParam(
          _dateTimw,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GetUserNotesStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetUserNotesStruct(
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        dateTimw: deserializeParam(
          data['dateTimw'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GetUserNotesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetUserNotesStruct &&
        notes == other.notes &&
        dateTimw == other.dateTimw;
  }

  @override
  int get hashCode => const ListEquality().hash([notes, dateTimw]);
}

GetUserNotesStruct createGetUserNotesStruct({
  String? notes,
  DateTime? dateTimw,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetUserNotesStruct(
      notes: notes,
      dateTimw: dateTimw,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetUserNotesStruct? updateGetUserNotesStruct(
  GetUserNotesStruct? getUserNotes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getUserNotes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetUserNotesStructData(
  Map<String, dynamic> firestoreData,
  GetUserNotesStruct? getUserNotes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getUserNotes == null) {
    return;
  }
  if (getUserNotes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && getUserNotes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getUserNotesData =
      getGetUserNotesFirestoreData(getUserNotes, forFieldValue);
  final nestedData =
      getUserNotesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = getUserNotes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetUserNotesFirestoreData(
  GetUserNotesStruct? getUserNotes, [
  bool forFieldValue = false,
]) {
  if (getUserNotes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getUserNotes.toMap());

  // Add any Firestore field values
  getUserNotes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetUserNotesListFirestoreData(
  List<GetUserNotesStruct>? getUserNotess,
) =>
    getUserNotess?.map((e) => getGetUserNotesFirestoreData(e, true)).toList() ??
    [];
