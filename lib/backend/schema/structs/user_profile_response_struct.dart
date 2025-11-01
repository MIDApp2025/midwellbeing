// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserProfileResponseStruct extends FFFirebaseStruct {
  UserProfileResponseStruct({
    String? displayName,
    String? country,
    String? city,
    String? bio,
    String? photo,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _displayName = displayName,
        _country = country,
        _city = city,
        _bio = bio,
        _photo = photo,
        _email = email,
        super(firestoreUtilData);

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static UserProfileResponseStruct fromMap(Map<String, dynamic> data) =>
      UserProfileResponseStruct(
        displayName: data['display_name'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
        bio: data['bio'] as String?,
        photo: data['photo'] as String?,
        email: data['email'] as String?,
      );

  static UserProfileResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'display_name': _displayName,
        'country': _country,
        'city': _city,
        'bio': _bio,
        'photo': _photo,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserProfileResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserProfileResponseStruct(
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserProfileResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileResponseStruct &&
        displayName == other.displayName &&
        country == other.country &&
        city == other.city &&
        bio == other.bio &&
        photo == other.photo &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([displayName, country, city, bio, photo, email]);
}

UserProfileResponseStruct createUserProfileResponseStruct({
  String? displayName,
  String? country,
  String? city,
  String? bio,
  String? photo,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileResponseStruct(
      displayName: displayName,
      country: country,
      city: city,
      bio: bio,
      photo: photo,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileResponseStruct? updateUserProfileResponseStruct(
  UserProfileResponseStruct? userProfileResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfileResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileResponseStructData(
  Map<String, dynamic> firestoreData,
  UserProfileResponseStruct? userProfileResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfileResponse == null) {
    return;
  }
  if (userProfileResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfileResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileResponseData =
      getUserProfileResponseFirestoreData(userProfileResponse, forFieldValue);
  final nestedData =
      userProfileResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userProfileResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileResponseFirestoreData(
  UserProfileResponseStruct? userProfileResponse, [
  bool forFieldValue = false,
]) {
  if (userProfileResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfileResponse.toMap());

  // Add any Firestore field values
  userProfileResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileResponseListFirestoreData(
  List<UserProfileResponseStruct>? userProfileResponses,
) =>
    userProfileResponses
        ?.map((e) => getUserProfileResponseFirestoreData(e, true))
        .toList() ??
    [];
