import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// api tekstit graafeille
class DailySummariesRecord extends FirestoreRecord {
  DailySummariesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "average" field.
  double? _average;
  double get average => _average ?? 0.0;
  bool hasAverage() => _average != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "lastUpdated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _type = snapshotData['type'] as String?;
    _date = snapshotData['date'] as String?;
    _average = castToType<double>(snapshotData['average']);
    _summary = snapshotData['summary'] as String?;
    _language = snapshotData['language'] as String?;
    _lastUpdated = snapshotData['lastUpdated'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('dailySummaries');

  static Stream<DailySummariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailySummariesRecord.fromSnapshot(s));

  static Future<DailySummariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailySummariesRecord.fromSnapshot(s));

  static DailySummariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailySummariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailySummariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailySummariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailySummariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailySummariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailySummariesRecordData({
  String? userId,
  String? type,
  String? date,
  double? average,
  String? summary,
  String? language,
  DateTime? lastUpdated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'type': type,
      'date': date,
      'average': average,
      'summary': summary,
      'language': language,
      'lastUpdated': lastUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailySummariesRecordDocumentEquality
    implements Equality<DailySummariesRecord> {
  const DailySummariesRecordDocumentEquality();

  @override
  bool equals(DailySummariesRecord? e1, DailySummariesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.date == e2?.date &&
        e1?.average == e2?.average &&
        e1?.summary == e2?.summary &&
        e1?.language == e2?.language &&
        e1?.lastUpdated == e2?.lastUpdated;
  }

  @override
  int hash(DailySummariesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.type,
        e?.date,
        e?.average,
        e?.summary,
        e?.language,
        e?.lastUpdated
      ]);

  @override
  bool isValidKey(Object? o) => o is DailySummariesRecord;
}
