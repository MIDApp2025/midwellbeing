// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ConfidenceTestQuestionStruct extends FFFirebaseStruct {
  ConfidenceTestQuestionStruct({
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
    String? category,
    String? language,
    String? documentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _question0 = question0,
        _question1 = question1,
        _question2 = question2,
        _question3 = question3,
        _question4 = question4,
        _question5 = question5,
        _question6 = question6,
        _question7 = question7,
        _question8 = question8,
        _question9 = question9,
        _category = category,
        _language = language,
        _documentId = documentId,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "question0" field.
  String? _question0;
  String get question0 => _question0 ?? '';
  set question0(String? val) => _question0 = val;

  bool hasQuestion0() => _question0 != null;

  // "question1" field.
  String? _question1;
  String get question1 => _question1 ?? '';
  set question1(String? val) => _question1 = val;

  bool hasQuestion1() => _question1 != null;

  // "question2" field.
  String? _question2;
  String get question2 => _question2 ?? '';
  set question2(String? val) => _question2 = val;

  bool hasQuestion2() => _question2 != null;

  // "question3" field.
  String? _question3;
  String get question3 => _question3 ?? '';
  set question3(String? val) => _question3 = val;

  bool hasQuestion3() => _question3 != null;

  // "question4" field.
  String? _question4;
  String get question4 => _question4 ?? '';
  set question4(String? val) => _question4 = val;

  bool hasQuestion4() => _question4 != null;

  // "question5" field.
  String? _question5;
  String get question5 => _question5 ?? '';
  set question5(String? val) => _question5 = val;

  bool hasQuestion5() => _question5 != null;

  // "question6" field.
  String? _question6;
  String get question6 => _question6 ?? '';
  set question6(String? val) => _question6 = val;

  bool hasQuestion6() => _question6 != null;

  // "question7" field.
  String? _question7;
  String get question7 => _question7 ?? '';
  set question7(String? val) => _question7 = val;

  bool hasQuestion7() => _question7 != null;

  // "question8" field.
  String? _question8;
  String get question8 => _question8 ?? '';
  set question8(String? val) => _question8 = val;

  bool hasQuestion8() => _question8 != null;

  // "question9" field.
  String? _question9;
  String get question9 => _question9 ?? '';
  set question9(String? val) => _question9 = val;

  bool hasQuestion9() => _question9 != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "documentId" field.
  String? _documentId;
  String get documentId => _documentId ?? '';
  set documentId(String? val) => _documentId = val;

  bool hasDocumentId() => _documentId != null;

  static ConfidenceTestQuestionStruct fromMap(Map<String, dynamic> data) =>
      ConfidenceTestQuestionStruct(
        title: data['title'] as String?,
        question0: data['question0'] as String?,
        question1: data['question1'] as String?,
        question2: data['question2'] as String?,
        question3: data['question3'] as String?,
        question4: data['question4'] as String?,
        question5: data['question5'] as String?,
        question6: data['question6'] as String?,
        question7: data['question7'] as String?,
        question8: data['question8'] as String?,
        question9: data['question9'] as String?,
        category: data['category'] as String?,
        language: data['language'] as String?,
        documentId: data['documentId'] as String?,
      );

  static ConfidenceTestQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfidenceTestQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'question0': _question0,
        'question1': _question1,
        'question2': _question2,
        'question3': _question3,
        'question4': _question4,
        'question5': _question5,
        'question6': _question6,
        'question7': _question7,
        'question8': _question8,
        'question9': _question9,
        'category': _category,
        'language': _language,
        'documentId': _documentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'question0': serializeParam(
          _question0,
          ParamType.String,
        ),
        'question1': serializeParam(
          _question1,
          ParamType.String,
        ),
        'question2': serializeParam(
          _question2,
          ParamType.String,
        ),
        'question3': serializeParam(
          _question3,
          ParamType.String,
        ),
        'question4': serializeParam(
          _question4,
          ParamType.String,
        ),
        'question5': serializeParam(
          _question5,
          ParamType.String,
        ),
        'question6': serializeParam(
          _question6,
          ParamType.String,
        ),
        'question7': serializeParam(
          _question7,
          ParamType.String,
        ),
        'question8': serializeParam(
          _question8,
          ParamType.String,
        ),
        'question9': serializeParam(
          _question9,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'documentId': serializeParam(
          _documentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfidenceTestQuestionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConfidenceTestQuestionStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        question0: deserializeParam(
          data['question0'],
          ParamType.String,
          false,
        ),
        question1: deserializeParam(
          data['question1'],
          ParamType.String,
          false,
        ),
        question2: deserializeParam(
          data['question2'],
          ParamType.String,
          false,
        ),
        question3: deserializeParam(
          data['question3'],
          ParamType.String,
          false,
        ),
        question4: deserializeParam(
          data['question4'],
          ParamType.String,
          false,
        ),
        question5: deserializeParam(
          data['question5'],
          ParamType.String,
          false,
        ),
        question6: deserializeParam(
          data['question6'],
          ParamType.String,
          false,
        ),
        question7: deserializeParam(
          data['question7'],
          ParamType.String,
          false,
        ),
        question8: deserializeParam(
          data['question8'],
          ParamType.String,
          false,
        ),
        question9: deserializeParam(
          data['question9'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        documentId: deserializeParam(
          data['documentId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfidenceTestQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfidenceTestQuestionStruct &&
        title == other.title &&
        question0 == other.question0 &&
        question1 == other.question1 &&
        question2 == other.question2 &&
        question3 == other.question3 &&
        question4 == other.question4 &&
        question5 == other.question5 &&
        question6 == other.question6 &&
        question7 == other.question7 &&
        question8 == other.question8 &&
        question9 == other.question9 &&
        category == other.category &&
        language == other.language &&
        documentId == other.documentId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        question0,
        question1,
        question2,
        question3,
        question4,
        question5,
        question6,
        question7,
        question8,
        question9,
        category,
        language,
        documentId
      ]);
}

ConfidenceTestQuestionStruct createConfidenceTestQuestionStruct({
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
  String? category,
  String? language,
  String? documentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfidenceTestQuestionStruct(
      title: title,
      question0: question0,
      question1: question1,
      question2: question2,
      question3: question3,
      question4: question4,
      question5: question5,
      question6: question6,
      question7: question7,
      question8: question8,
      question9: question9,
      category: category,
      language: language,
      documentId: documentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfidenceTestQuestionStruct? updateConfidenceTestQuestionStruct(
  ConfidenceTestQuestionStruct? confidenceTestQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    confidenceTestQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfidenceTestQuestionStructData(
  Map<String, dynamic> firestoreData,
  ConfidenceTestQuestionStruct? confidenceTestQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (confidenceTestQuestion == null) {
    return;
  }
  if (confidenceTestQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      confidenceTestQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final confidenceTestQuestionData = getConfidenceTestQuestionFirestoreData(
      confidenceTestQuestion, forFieldValue);
  final nestedData =
      confidenceTestQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      confidenceTestQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfidenceTestQuestionFirestoreData(
  ConfidenceTestQuestionStruct? confidenceTestQuestion, [
  bool forFieldValue = false,
]) {
  if (confidenceTestQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(confidenceTestQuestion.toMap());

  // Add any Firestore field values
  confidenceTestQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfidenceTestQuestionListFirestoreData(
  List<ConfidenceTestQuestionStruct>? confidenceTestQuestions,
) =>
    confidenceTestQuestions
        ?.map((e) => getConfidenceTestQuestionFirestoreData(e, true))
        .toList() ??
    [];
