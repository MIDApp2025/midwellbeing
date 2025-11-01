import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// strenghtValuaTap
class StrengthEntriesRecord extends FirestoreRecord {
  StrengthEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "strength" field.
  double? _strength;
  double get strength => _strength ?? 0.0;
  bool hasStrength() => _strength != null;

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
    _strength = castToType<double>(snapshotData['strength']);
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('strengthEntries');

  static Stream<StrengthEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StrengthEntriesRecord.fromSnapshot(s));

  static Future<StrengthEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StrengthEntriesRecord.fromSnapshot(s));

  static StrengthEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StrengthEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StrengthEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StrengthEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StrengthEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StrengthEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStrengthEntriesRecordData({
  double? strength,
  String? userId,
  DateTime? timestamp,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'strength': strength,
      'user_id': userId,
      'timestamp': timestamp,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class StrengthEntriesRecordDocumentEquality
    implements Equality<StrengthEntriesRecord> {
  const StrengthEntriesRecordDocumentEquality();

  @override
  bool equals(StrengthEntriesRecord? e1, StrengthEntriesRecord? e2) {
    return e1?.strength == e2?.strength &&
        e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type;
  }

  @override
  int hash(StrengthEntriesRecord? e) => const ListEquality()
      .hash([e?.strength, e?.userId, e?.timestamp, e?.type]);

  @override
  bool isValidKey(Object? o) => o is StrengthEntriesRecord;
}
