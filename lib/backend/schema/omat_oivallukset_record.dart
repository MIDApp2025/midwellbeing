import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OmatOivalluksetRecord extends FirestoreRecord {
  OmatOivalluksetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "is_important" field.
  bool? _isImportant;
  bool get isImportant => _isImportant ?? false;
  bool hasIsImportant() => _isImportant != null;

  // "messageContent" field.
  String? _messageContent;
  String get messageContent => _messageContent ?? '';
  bool hasMessageContent() => _messageContent != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  void _initializeFields() {
    _userId = snapshotData['UserId'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _isImportant = snapshotData['is_important'] as bool?;
    _messageContent = snapshotData['messageContent'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('omatOivallukset');

  static Stream<OmatOivalluksetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OmatOivalluksetRecord.fromSnapshot(s));

  static Future<OmatOivalluksetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OmatOivalluksetRecord.fromSnapshot(s));

  static OmatOivalluksetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OmatOivalluksetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OmatOivalluksetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OmatOivalluksetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OmatOivalluksetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OmatOivalluksetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOmatOivalluksetRecordData({
  String? userId,
  DateTime? timeStamp,
  bool? isImportant,
  String? messageContent,
  String? sessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserId': userId,
      'timeStamp': timeStamp,
      'is_important': isImportant,
      'messageContent': messageContent,
      'sessionId': sessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OmatOivalluksetRecordDocumentEquality
    implements Equality<OmatOivalluksetRecord> {
  const OmatOivalluksetRecordDocumentEquality();

  @override
  bool equals(OmatOivalluksetRecord? e1, OmatOivalluksetRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.isImportant == e2?.isImportant &&
        e1?.messageContent == e2?.messageContent &&
        e1?.sessionId == e2?.sessionId;
  }

  @override
  int hash(OmatOivalluksetRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.timeStamp,
        e?.isImportant,
        e?.messageContent,
        e?.sessionId
      ]);

  @override
  bool isValidKey(Object? o) => o is OmatOivalluksetRecord;
}
