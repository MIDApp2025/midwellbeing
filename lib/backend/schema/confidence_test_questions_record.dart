import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfidenceTestQuestionsRecord extends FirestoreRecord {
  ConfidenceTestQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "question0" field.
  String? _question0;
  String get question0 => _question0 ?? '';
  bool hasQuestion0() => _question0 != null;

  // "question1" field.
  String? _question1;
  String get question1 => _question1 ?? '';
  bool hasQuestion1() => _question1 != null;

  // "question2" field.
  String? _question2;
  String get question2 => _question2 ?? '';
  bool hasQuestion2() => _question2 != null;

  // "question3" field.
  String? _question3;
  String get question3 => _question3 ?? '';
  bool hasQuestion3() => _question3 != null;

  // "question4" field.
  String? _question4;
  String get question4 => _question4 ?? '';
  bool hasQuestion4() => _question4 != null;

  // "question5" field.
  String? _question5;
  String get question5 => _question5 ?? '';
  bool hasQuestion5() => _question5 != null;

  // "question6" field.
  String? _question6;
  String get question6 => _question6 ?? '';
  bool hasQuestion6() => _question6 != null;

  // "question7" field.
  String? _question7;
  String get question7 => _question7 ?? '';
  bool hasQuestion7() => _question7 != null;

  // "question8" field.
  String? _question8;
  String get question8 => _question8 ?? '';
  bool hasQuestion8() => _question8 != null;

  // "question9" field.
  String? _question9;
  String get question9 => _question9 ?? '';
  bool hasQuestion9() => _question9 != null;

  // "question10" field.
  String? _question10;
  String get question10 => _question10 ?? '';
  bool hasQuestion10() => _question10 != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "documentId" field.
  String? _documentId;
  String get documentId => _documentId ?? '';
  bool hasDocumentId() => _documentId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _question0 = snapshotData['question0'] as String?;
    _question1 = snapshotData['question1'] as String?;
    _question2 = snapshotData['question2'] as String?;
    _question3 = snapshotData['question3'] as String?;
    _question4 = snapshotData['question4'] as String?;
    _question5 = snapshotData['question5'] as String?;
    _question6 = snapshotData['question6'] as String?;
    _question7 = snapshotData['question7'] as String?;
    _question8 = snapshotData['question8'] as String?;
    _question9 = snapshotData['question9'] as String?;
    _question10 = snapshotData['question10'] as String?;
    _category = snapshotData['category'] as String?;
    _language = snapshotData['language'] as String?;
    _documentId = snapshotData['documentId'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('confidenceTestQuestions');

  static Stream<ConfidenceTestQuestionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ConfidenceTestQuestionsRecord.fromSnapshot(s));

  static Future<ConfidenceTestQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfidenceTestQuestionsRecord.fromSnapshot(s));

  static ConfidenceTestQuestionsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ConfidenceTestQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfidenceTestQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfidenceTestQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfidenceTestQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfidenceTestQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfidenceTestQuestionsRecordData({
  String? title,
  String? question0,
  String? question1,
  String? question2,
  String? question3,
  String? question4,
  String? question5,
  String? question6,
  String? question7,
  String? question8,
  String? question9,
  String? question10,
  String? category,
  String? language,
  String? documentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'question0': question0,
      'question1': question1,
      'question2': question2,
      'question3': question3,
      'question4': question4,
      'question5': question5,
      'question6': question6,
      'question7': question7,
      'question8': question8,
      'question9': question9,
      'question10': question10,
      'category': category,
      'language': language,
      'documentId': documentId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfidenceTestQuestionsRecordDocumentEquality
    implements Equality<ConfidenceTestQuestionsRecord> {
  const ConfidenceTestQuestionsRecordDocumentEquality();

  @override
  bool equals(
      ConfidenceTestQuestionsRecord? e1, ConfidenceTestQuestionsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.question0 == e2?.question0 &&
        e1?.question1 == e2?.question1 &&
        e1?.question2 == e2?.question2 &&
        e1?.question3 == e2?.question3 &&
        e1?.question4 == e2?.question4 &&
        e1?.question5 == e2?.question5 &&
        e1?.question6 == e2?.question6 &&
        e1?.question7 == e2?.question7 &&
        e1?.question8 == e2?.question8 &&
        e1?.question9 == e2?.question9 &&
        e1?.question10 == e2?.question10 &&
        e1?.category == e2?.category &&
        e1?.language == e2?.language &&
        e1?.documentId == e2?.documentId;
  }

  @override
  int hash(ConfidenceTestQuestionsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.question0,
        e?.question1,
        e?.question2,
        e?.question3,
        e?.question4,
        e?.question5,
        e?.question6,
        e?.question7,
        e?.question8,
        e?.question9,
        e?.question10,
        e?.category,
        e?.language,
        e?.documentId
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfidenceTestQuestionsRecord;
}
