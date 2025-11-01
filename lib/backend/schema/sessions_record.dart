import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "lastActivity" field.
  DateTime? _lastActivity;
  DateTime? get lastActivity => _lastActivity;
  bool hasLastActivity() => _lastActivity != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _lastActivity = snapshotData['lastActivity'] as DateTime?;
    _archived = snapshotData['archived'] as bool?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? userId,
  DateTime? lastActivity,
  bool? archived,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'lastActivity': lastActivity,
      'archived': archived,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.lastActivity == e2?.lastActivity &&
        e1?.archived == e2?.archived;
  }

  @override
  int hash(SessionsRecord? e) =>
      const ListEquality().hash([e?.userId, e?.lastActivity, e?.archived]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
