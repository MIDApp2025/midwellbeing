import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// belongingValuaTap
class BelongingEntriesRecord extends FirestoreRecord {
  BelongingEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "belonging" field.
  double? _belonging;
  double get belonging => _belonging ?? 0.0;
  bool hasBelonging() => _belonging != null;

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
    _belonging = castToType<double>(snapshotData['belonging']);
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('belongingEntries');

  static Stream<BelongingEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BelongingEntriesRecord.fromSnapshot(s));

  static Future<BelongingEntriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BelongingEntriesRecord.fromSnapshot(s));

  static BelongingEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BelongingEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BelongingEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BelongingEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BelongingEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BelongingEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBelongingEntriesRecordData({
  double? belonging,
  String? userId,
  DateTime? timestamp,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'belonging': belonging,
      'user_id': userId,
      'timestamp': timestamp,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class BelongingEntriesRecordDocumentEquality
    implements Equality<BelongingEntriesRecord> {
  const BelongingEntriesRecordDocumentEquality();

  @override
  bool equals(BelongingEntriesRecord? e1, BelongingEntriesRecord? e2) {
    return e1?.belonging == e2?.belonging &&
        e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type;
  }

  @override
  int hash(BelongingEntriesRecord? e) => const ListEquality()
      .hash([e?.belonging, e?.userId, e?.timestamp, e?.type]);

  @override
  bool isValidKey(Object? o) => o is BelongingEntriesRecord;
}
