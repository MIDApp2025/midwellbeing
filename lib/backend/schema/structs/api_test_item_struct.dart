// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Testikutsut dropdowneihin
class ApiTestItemStruct extends FFFirebaseStruct {
  ApiTestItemStruct({
    String? id,
    String? title,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _language = language,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  static ApiTestItemStruct fromMap(Map<String, dynamic> data) =>
      ApiTestItemStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        language: data['language'] as String?,
      );

  static ApiTestItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ApiTestItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static ApiTestItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ApiTestItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ApiTestItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ApiTestItemStruct &&
        id == other.id &&
        title == other.title &&
        language == other.language;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, language]);
}

ApiTestItemStruct createApiTestItemStruct({
  String? id,
  String? title,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApiTestItemStruct(
      id: id,
      title: title,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ApiTestItemStruct? updateApiTestItemStruct(
  ApiTestItemStruct? apiTestItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    apiTestItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addApiTestItemStructData(
  Map<String, dynamic> firestoreData,
  ApiTestItemStruct? apiTestItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (apiTestItem == null) {
    return;
  }
  if (apiTestItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && apiTestItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final apiTestItemData =
      getApiTestItemFirestoreData(apiTestItem, forFieldValue);
  final nestedData =
      apiTestItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = apiTestItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getApiTestItemFirestoreData(
  ApiTestItemStruct? apiTestItem, [
  bool forFieldValue = false,
]) {
  if (apiTestItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(apiTestItem.toMap());

  // Add any Firestore field values
  apiTestItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApiTestItemListFirestoreData(
  List<ApiTestItemStruct>? apiTestItems,
) =>
    apiTestItems?.map((e) => getApiTestItemFirestoreData(e, true)).toList() ??
    [];
