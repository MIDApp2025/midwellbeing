import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyReportsRecord extends FirestoreRecord {
  WeeklyReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "week" field.
  int? _week;
  int get week => _week ?? 0;
  bool hasWeek() => _week != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _week = castToType<int>(snapshotData['week']);
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('weeklyReports');

  static Stream<WeeklyReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeeklyReportsRecord.fromSnapshot(s));

  static Future<WeeklyReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeeklyReportsRecord.fromSnapshot(s));

  static WeeklyReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeeklyReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeeklyReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeeklyReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeeklyReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeeklyReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeeklyReportsRecordData({
  String? userId,
  int? week,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'week': week,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeeklyReportsRecordDocumentEquality
    implements Equality<WeeklyReportsRecord> {
  const WeeklyReportsRecordDocumentEquality();

  @override
  bool equals(WeeklyReportsRecord? e1, WeeklyReportsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.week == e2?.week &&
        e1?.year == e2?.year;
  }

  @override
  int hash(WeeklyReportsRecord? e) =>
      const ListEquality().hash([e?.userId, e?.week, e?.year]);

  @override
  bool isValidKey(Object? o) => o is WeeklyReportsRecord;
}
