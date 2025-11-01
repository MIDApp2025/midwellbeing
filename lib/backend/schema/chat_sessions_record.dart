import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatSessionsRecord extends FirestoreRecord {
  ChatSessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('ChatSessions');

  static Stream<ChatSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatSessionsRecord.fromSnapshot(s));

  static Future<ChatSessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatSessionsRecord.fromSnapshot(s));

  static ChatSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatSessionsRecordData({
  String? userId,
  DateTime? createdAt,
  String? title,
  String? sessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'createdAt': createdAt,
      'title': title,
      'sessionId': sessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatSessionsRecordDocumentEquality
    implements Equality<ChatSessionsRecord> {
  const ChatSessionsRecordDocumentEquality();

  @override
  bool equals(ChatSessionsRecord? e1, ChatSessionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.title == e2?.title &&
        e1?.sessionId == e2?.sessionId;
  }

  @override
  int hash(ChatSessionsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.createdAt, e?.title, e?.sessionId]);

  @override
  bool isValidKey(Object? o) => o is ChatSessionsRecord;
}
