// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MonthPeriodStruct extends FFFirebaseStruct {
  MonthPeriodStruct({
    String? label,
    DateTime? startDate,
    DateTime? endDay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _startDate = startDate,
        _endDay = endDay,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "endDay" field.
  DateTime? _endDay;
  DateTime? get endDay => _endDay;
  set endDay(DateTime? val) => _endDay = val;

  bool hasEndDay() => _endDay != null;

  static MonthPeriodStruct fromMap(Map<String, dynamic> data) =>
      MonthPeriodStruct(
        label: data['label'] as String?,
        startDate: data['startDate'] as DateTime?,
        endDay: data['endDay'] as DateTime?,
      );

  static MonthPeriodStruct? maybeFromMap(dynamic data) => data is Map
      ? MonthPeriodStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'startDate': _startDate,
        'endDay': _endDay,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'endDay': serializeParam(
          _endDay,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MonthPeriodStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthPeriodStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        endDay: deserializeParam(
          data['endDay'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MonthPeriodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MonthPeriodStruct &&
        label == other.label &&
        startDate == other.startDate &&
        endDay == other.endDay;
  }

  @override
  int get hashCode => const ListEquality().hash([label, startDate, endDay]);
}

MonthPeriodStruct createMonthPeriodStruct({
  String? label,
  DateTime? startDate,
  DateTime? endDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MonthPeriodStruct(
      label: label,
      startDate: startDate,
      endDay: endDay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MonthPeriodStruct? updateMonthPeriodStruct(
  MonthPeriodStruct? monthPeriod, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    monthPeriod
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMonthPeriodStructData(
  Map<String, dynamic> firestoreData,
  MonthPeriodStruct? monthPeriod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (monthPeriod == null) {
    return;
  }
  if (monthPeriod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && monthPeriod.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final monthPeriodData =
      getMonthPeriodFirestoreData(monthPeriod, forFieldValue);
  final nestedData =
      monthPeriodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = monthPeriod.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMonthPeriodFirestoreData(
  MonthPeriodStruct? monthPeriod, [
  bool forFieldValue = false,
]) {
  if (monthPeriod == null) {
    return {};
  }
  final firestoreData = mapToFirestore(monthPeriod.toMap());

  // Add any Firestore field values
  monthPeriod.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMonthPeriodListFirestoreData(
  List<MonthPeriodStruct>? monthPeriods,
) =>
    monthPeriods?.map((e) => getMonthPeriodFirestoreData(e, true)).toList() ??
    [];
