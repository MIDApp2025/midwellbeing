import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetEntriesByCalenderRecord extends FirestoreRecord {
  GetEntriesByCalenderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('getEntriesByCalender');

  static Stream<GetEntriesByCalenderRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GetEntriesByCalenderRecord.fromSnapshot(s));

  static Future<GetEntriesByCalenderRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GetEntriesByCalenderRecord.fromSnapshot(s));

  static GetEntriesByCalenderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GetEntriesByCalenderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GetEntriesByCalenderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GetEntriesByCalenderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GetEntriesByCalenderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GetEntriesByCalenderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGetEntriesByCalenderRecordData({
  String? userId,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class GetEntriesByCalenderRecordDocumentEquality
    implements Equality<GetEntriesByCalenderRecord> {
  const GetEntriesByCalenderRecordDocumentEquality();

  @override
  bool equals(GetEntriesByCalenderRecord? e1, GetEntriesByCalenderRecord? e2) {
    return e1?.userId == e2?.userId && e1?.date == e2?.date;
  }

  @override
  int hash(GetEntriesByCalenderRecord? e) =>
      const ListEquality().hash([e?.userId, e?.date]);

  @override
  bool isValidKey(Object? o) => o is GetEntriesByCalenderRecord;
}
