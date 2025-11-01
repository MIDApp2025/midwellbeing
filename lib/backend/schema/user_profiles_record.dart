import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfilesRecord extends FirestoreRecord {
  UserProfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _bio = snapshotData['bio'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('userProfiles');

  static Stream<UserProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfilesRecord.fromSnapshot(s));

  static Future<UserProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfilesRecord.fromSnapshot(s));

  static UserProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfilesRecordData({
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? city,
  String? country,
  String? bio,
  String? email,
  String? phoneNumber,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'city': city,
      'country': country,
      'bio': bio,
      'email': email,
      'phone_number': phoneNumber,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProfilesRecordDocumentEquality
    implements Equality<UserProfilesRecord> {
  const UserProfilesRecordDocumentEquality();

  @override
  bool equals(UserProfilesRecord? e1, UserProfilesRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.bio == e2?.bio &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(UserProfilesRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.city,
        e?.country,
        e?.bio,
        e?.email,
        e?.phoneNumber,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfilesRecord;
}
