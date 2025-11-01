import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMemoriesRecord extends FirestoreRecord {
  ChatMemoriesRecord._(
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

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _summary = snapshotData['summary'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('chatMemories');

  static Stream<ChatMemoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMemoriesRecord.fromSnapshot(s));

  static Future<ChatMemoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMemoriesRecord.fromSnapshot(s));

  static ChatMemoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMemoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMemoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMemoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMemoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMemoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMemoriesRecordData({
  String? userId,
  String? sessionId,
  String? summary,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sessionId': sessionId,
      'summary': summary,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMemoriesRecordDocumentEquality
    implements Equality<ChatMemoriesRecord> {
  const ChatMemoriesRecordDocumentEquality();

  @override
  bool equals(ChatMemoriesRecord? e1, ChatMemoriesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sessionId == e2?.sessionId &&
        e1?.summary == e2?.summary &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(ChatMemoriesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.sessionId, e?.summary, e?.timeStamp]);

  @override
  bool isValidKey(Object? o) => o is ChatMemoriesRecord;
}
