// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GetProfilePicStruct extends FFFirebaseStruct {
  GetProfilePicStruct({
    String? photoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photoUrl = photoUrl,
        super(firestoreUtilData);

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  static GetProfilePicStruct fromMap(Map<String, dynamic> data) =>
      GetProfilePicStruct(
        photoUrl: data['photo_url'] as String?,
      );

  static GetProfilePicStruct? maybeFromMap(dynamic data) => data is Map
      ? GetProfilePicStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo_url': _photoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetProfilePicStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetProfilePicStruct(
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetProfilePicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetProfilePicStruct && photoUrl == other.photoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([photoUrl]);
}

GetProfilePicStruct createGetProfilePicStruct({
  String? photoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetProfilePicStruct(
      photoUrl: photoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetProfilePicStruct? updateGetProfilePicStruct(
  GetProfilePicStruct? getProfilePic, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getProfilePic
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetProfilePicStructData(
  Map<String, dynamic> firestoreData,
  GetProfilePicStruct? getProfilePic,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getProfilePic == null) {
    return;
  }
  if (getProfilePic.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && getProfilePic.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getProfilePicData =
      getGetProfilePicFirestoreData(getProfilePic, forFieldValue);
  final nestedData =
      getProfilePicData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = getProfilePic.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetProfilePicFirestoreData(
  GetProfilePicStruct? getProfilePic, [
  bool forFieldValue = false,
]) {
  if (getProfilePic == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getProfilePic.toMap());

  // Add any Firestore field values
  getProfilePic.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetProfilePicListFirestoreData(
  List<GetProfilePicStruct>? getProfilePics,
) =>
    getProfilePics
        ?.map((e) => getGetProfilePicFirestoreData(e, true))
        .toList() ??
    [];
