import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMemoriesArchiveRecord extends FirestoreRecord {
  ChatMemoriesArchiveRecord._(
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

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _summary = snapshotData['summary'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('ChatMemoriesArchive');

  static Stream<ChatMemoriesArchiveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMemoriesArchiveRecord.fromSnapshot(s));

  static Future<ChatMemoriesArchiveRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChatMemoriesArchiveRecord.fromSnapshot(s));

  static ChatMemoriesArchiveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMemoriesArchiveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMemoriesArchiveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMemoriesArchiveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMemoriesArchiveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMemoriesArchiveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMemoriesArchiveRecordData({
  String? userId,
  String? sessionId,
  DateTime? createdAt,
  String? summary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sessionId': sessionId,
      'createdAt': createdAt,
      'summary': summary,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMemoriesArchiveRecordDocumentEquality
    implements Equality<ChatMemoriesArchiveRecord> {
  const ChatMemoriesArchiveRecordDocumentEquality();

  @override
  bool equals(ChatMemoriesArchiveRecord? e1, ChatMemoriesArchiveRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sessionId == e2?.sessionId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.summary == e2?.summary;
  }

  @override
  int hash(ChatMemoriesArchiveRecord? e) => const ListEquality()
      .hash([e?.userId, e?.sessionId, e?.createdAt, e?.summary]);

  @override
  bool isValidKey(Object? o) => o is ChatMemoriesArchiveRecord;
}
