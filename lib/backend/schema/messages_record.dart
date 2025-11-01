import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// chatMessages
class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "docId" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _role = snapshotData['role'] as String?;
    _message = snapshotData['message'] as String?;
    _docId = snapshotData['docId'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? userId,
  String? sessionId,
  String? role,
  String? message,
  String? docId,
  DateTime? timeStamp,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sessionId': sessionId,
      'role': role,
      'message': message,
      'docId': docId,
      'timeStamp': timeStamp,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sessionId == e2?.sessionId &&
        e1?.role == e2?.role &&
        e1?.message == e2?.message &&
        e1?.docId == e2?.docId &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.text == e2?.text;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.sessionId,
        e?.role,
        e?.message,
        e?.docId,
        e?.timeStamp,
        e?.text
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
