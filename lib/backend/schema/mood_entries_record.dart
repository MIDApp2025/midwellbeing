import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodEntriesRecord extends FirestoreRecord {
  MoodEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mood" field.
  double? _mood;
  double get mood => _mood ?? 0.0;
  bool hasMood() => _mood != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _mood = castToType<double>(snapshotData['mood']);
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('moodEntries');

  static Stream<MoodEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodEntriesRecord.fromSnapshot(s));

  static Future<MoodEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodEntriesRecord.fromSnapshot(s));

  static MoodEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodEntriesRecordData({
  double? mood,
  String? userId,
  DateTime? timestamp,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mood': mood,
      'user_id': userId,
      'timestamp': timestamp,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodEntriesRecordDocumentEquality implements Equality<MoodEntriesRecord> {
  const MoodEntriesRecordDocumentEquality();

  @override
  bool equals(MoodEntriesRecord? e1, MoodEntriesRecord? e2) {
    return e1?.mood == e2?.mood &&
        e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type;
  }

  @override
  int hash(MoodEntriesRecord? e) =>
      const ListEquality().hash([e?.mood, e?.userId, e?.timestamp, e?.type]);

  @override
  bool isValidKey(Object? o) => o is MoodEntriesRecord;
}
