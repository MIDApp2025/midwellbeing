import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_grap_new_widget.dart' show MoodGrapNewWidget;
import 'package:flutter/material.dart';

class MoodGrapNewModel extends FlutterFlowModel<MoodGrapNewWidget> {
  ///  Local state fields for this page.

  String? moodResponseTest;

  List<String> rawDates = [];
  void addToRawDates(String item) => rawDates.add(item);
  void removeFromRawDates(String item) => rawDates.remove(item);
  void removeAtIndexFromRawDates(int index) => rawDates.removeAt(index);
  void insertAtIndexInRawDates(int index, String item) =>
      rawDates.insert(index, item);
  void updateRawDatesAtIndex(int index, Function(String) updateFn) =>
      rawDates[index] = updateFn(rawDates[index]);

  List<DateTime> convertDays = [];
  void addToConvertDays(DateTime item) => convertDays.add(item);
  void removeFromConvertDays(DateTime item) => convertDays.remove(item);
  void removeAtIndexFromConvertDays(int index) => convertDays.removeAt(index);
  void insertAtIndexInConvertDays(int index, DateTime item) =>
      convertDays.insert(index, item);
  void updateConvertDaysAtIndex(int index, Function(DateTime) updateFn) =>
      convertDays[index] = updateFn(convertDays[index]);

  List<DateTime> markedDatesForCalendar = [];
  void addToMarkedDatesForCalendar(DateTime item) =>
      markedDatesForCalendar.add(item);
  void removeFromMarkedDatesForCalendar(DateTime item) =>
      markedDatesForCalendar.remove(item);
  void removeAtIndexFromMarkedDatesForCalendar(int index) =>
      markedDatesForCalendar.removeAt(index);
  void insertAtIndexInMarkedDatesForCalendar(int index, DateTime item) =>
      markedDatesForCalendar.insert(index, item);
  void updateMarkedDatesForCalendarAtIndex(
          int index, Function(DateTime) updateFn) =>
      markedDatesForCalendar[index] = updateFn(markedDatesForCalendar[index]);

  List<String> calenderDates = [];
  void addToCalenderDates(String item) => calenderDates.add(item);
  void removeFromCalenderDates(String item) => calenderDates.remove(item);
  void removeAtIndexFromCalenderDates(int index) =>
      calenderDates.removeAt(index);
  void insertAtIndexInCalenderDates(int index, String item) =>
      calenderDates.insert(index, item);
  void updateCalenderDatesAtIndex(int index, Function(String) updateFn) =>
      calenderDates[index] = updateFn(calenderDates[index]);

  List<String> markedYmdDates = [];
  void addToMarkedYmdDates(String item) => markedYmdDates.add(item);
  void removeFromMarkedYmdDates(String item) => markedYmdDates.remove(item);
  void removeAtIndexFromMarkedYmdDates(int index) =>
      markedYmdDates.removeAt(index);
  void insertAtIndexInMarkedYmdDates(int index, String item) =>
      markedYmdDates.insert(index, item);
  void updateMarkedYmdDatesAtIndex(int index, Function(String) updateFn) =>
      markedYmdDates[index] = updateFn(markedYmdDates[index]);

  String? currentStartMonth;

  String? currentEndMonth;

  List<dynamic> summaryItemsCalender = [];
  void addToSummaryItemsCalender(dynamic item) =>
      summaryItemsCalender.add(item);
  void removeFromSummaryItemsCalender(dynamic item) =>
      summaryItemsCalender.remove(item);
  void removeAtIndexFromSummaryItemsCalender(int index) =>
      summaryItemsCalender.removeAt(index);
  void insertAtIndexInSummaryItemsCalender(int index, dynamic item) =>
      summaryItemsCalender.insert(index, item);
  void updateSummaryItemsCalenderAtIndex(
          int index, Function(dynamic) updateFn) =>
      summaryItemsCalender[index] = updateFn(summaryItemsCalender[index]);

  double? progress = 0.0;

  double? average = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getMoodDatesCalender )] action in MoodGrapNew widget.
  ApiCallResponse? apiCalender;
  // Stores action output result for [Backend Call - API (getDailySummaryMood)] action in MoodGrapNew widget.
  ApiCallResponse? moodResponse;
  // Stores action output result for [Backend Call - API (getEntriesByRangeMood )] action in MoodGrapNew widget.
  ApiCallResponse? apiResultProg;
  // Stores action output result for [Backend Call - API (getMoodDatesCalender )] action in MyCalendar widget.
  ApiCallResponse? apiResult3on;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
