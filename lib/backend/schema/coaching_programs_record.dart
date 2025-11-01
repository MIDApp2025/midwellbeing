import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachingProgramsRecord extends FirestoreRecord {
  CoachingProgramsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  bool hasEmoji() => _emoji != null;

  // "titleEn" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  bool hasTitleEn() => _titleEn != null;

  // "titleFi" field.
  String? _titleFi;
  String get titleFi => _titleFi ?? '';
  bool hasTitleFi() => _titleFi != null;

  // "longTitleEn" field.
  String? _longTitleEn;
  String get longTitleEn => _longTitleEn ?? '';
  bool hasLongTitleEn() => _longTitleEn != null;

  // "longTitleFi" field.
  String? _longTitleFi;
  String get longTitleFi => _longTitleFi ?? '';
  bool hasLongTitleFi() => _longTitleFi != null;

  // "contentEn" field.
  List<String>? _contentEn;
  List<String> get contentEn => _contentEn ?? const [];
  bool hasContentEn() => _contentEn != null;

  // "contentFi" field.
  List<String>? _contentFi;
  List<String> get contentFi => _contentFi ?? const [];
  bool hasContentFi() => _contentFi != null;

  void _initializeFields() {
    _emoji = snapshotData['emoji'] as String?;
    _titleEn = snapshotData['titleEn'] as String?;
    _titleFi = snapshotData['titleFi'] as String?;
    _longTitleEn = snapshotData['longTitleEn'] as String?;
    _longTitleFi = snapshotData['longTitleFi'] as String?;
    _contentEn = getDataList(snapshotData['contentEn']);
    _contentFi = getDataList(snapshotData['contentFi']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'midapp-21db4')
      .collection('coachingPrograms');

  static Stream<CoachingProgramsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoachingProgramsRecord.fromSnapshot(s));

  static Future<CoachingProgramsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CoachingProgramsRecord.fromSnapshot(s));

  static CoachingProgramsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoachingProgramsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoachingProgramsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoachingProgramsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoachingProgramsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoachingProgramsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoachingProgramsRecordData({
  String? emoji,
  String? titleEn,
  String? titleFi,
  String? longTitleEn,
  String? longTitleFi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'emoji': emoji,
      'titleEn': titleEn,
      'titleFi': titleFi,
      'longTitleEn': longTitleEn,
      'longTitleFi': longTitleFi,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoachingProgramsRecordDocumentEquality
    implements Equality<CoachingProgramsRecord> {
  const CoachingProgramsRecordDocumentEquality();

  @override
  bool equals(CoachingProgramsRecord? e1, CoachingProgramsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.emoji == e2?.emoji &&
        e1?.titleEn == e2?.titleEn &&
        e1?.titleFi == e2?.titleFi &&
        e1?.longTitleEn == e2?.longTitleEn &&
        e1?.longTitleFi == e2?.longTitleFi &&
        listEquality.equals(e1?.contentEn, e2?.contentEn) &&
        listEquality.equals(e1?.contentFi, e2?.contentFi);
  }

  @override
  int hash(CoachingProgramsRecord? e) => const ListEquality().hash([
        e?.emoji,
        e?.titleEn,
        e?.titleFi,
        e?.longTitleEn,
        e?.longTitleFi,
        e?.contentEn,
        e?.contentFi
      ]);

  @override
  bool isValidKey(Object? o) => o is CoachingProgramsRecord;
}
