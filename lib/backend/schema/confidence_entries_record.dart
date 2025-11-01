import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// confidenceValueTap
class ConfidenceEntriesRecord extends FirestoreRecord {
  ConfidenceEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "confidence" field.
  double? _confidence;
  double get confidence => _confidence ?? 0.0;
  bool hasConfidence() => _confidence != null;

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
    _confidence = castToType<double>(snapshotData['confidence']);
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('confidenceEntries');

  static Stream<ConfidenceEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfidenceEntriesRecord.fromSnapshot(s));

  static Future<ConfidenceEntriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfidenceEntriesRecord.fromSnapshot(s));

  static ConfidenceEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfidenceEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfidenceEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfidenceEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfidenceEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfidenceEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfidenceEntriesRecordData({
  double? confidence,
  String? userId,
  DateTime? timestamp,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'confidence': confidence,
      'user_id': userId,
      'timestamp': timestamp,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfidenceEntriesRecordDocumentEquality
    implements Equality<ConfidenceEntriesRecord> {
  const ConfidenceEntriesRecordDocumentEquality();

  @override
  bool equals(ConfidenceEntriesRecord? e1, ConfidenceEntriesRecord? e2) {
    return e1?.confidence == e2?.confidence &&
        e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type;
  }

  @override
  int hash(ConfidenceEntriesRecord? e) => const ListEquality()
      .hash([e?.confidence, e?.userId, e?.timestamp, e?.type]);

  @override
  bool isValidKey(Object? o) => o is ConfidenceEntriesRecord;
}
