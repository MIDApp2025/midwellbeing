import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'strengt_graph_widget.dart' show StrengtGraphWidget;
import 'package:flutter/material.dart';

class StrengtGraphModel extends FlutterFlowModel<StrengtGraphWidget> {
  ///  Local state fields for this page.

  List<dynamic> monthlyMoodEntries = [];
  void addToMonthlyMoodEntries(dynamic item) => monthlyMoodEntries.add(item);
  void removeFromMonthlyMoodEntries(dynamic item) =>
      monthlyMoodEntries.remove(item);
  void removeAtIndexFromMonthlyMoodEntries(int index) =>
      monthlyMoodEntries.removeAt(index);
  void insertAtIndexInMonthlyMoodEntries(int index, dynamic item) =>
      monthlyMoodEntries.insert(index, item);
  void updateMonthlyMoodEntriesAtIndex(int index, Function(dynamic) updateFn) =>
      monthlyMoodEntries[index] = updateFn(monthlyMoodEntries[index]);

  String? strengthText;

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

  String? currentMonthStart;

  String? currentMonthEnd;

  List<String> markedYmdDates = [];
  void addToMarkedYmdDates(String item) => markedYmdDates.add(item);
  void removeFromMarkedYmdDates(String item) => markedYmdDates.remove(item);
  void removeAtIndexFromMarkedYmdDates(int index) =>
      markedYmdDates.removeAt(index);
  void insertAtIndexInMarkedYmdDates(int index, String item) =>
      markedYmdDates.insert(index, item);
  void updateMarkedYmdDatesAtIndex(int index, Function(String) updateFn) =>
      markedYmdDates[index] = updateFn(markedYmdDates[index]);

  List<String> calenderDates = [];
  void addToCalenderDates(String item) => calenderDates.add(item);
  void removeFromCalenderDates(String item) => calenderDates.remove(item);
  void removeAtIndexFromCalenderDates(int index) =>
      calenderDates.removeAt(index);
  void insertAtIndexInCalenderDates(int index, String item) =>
      calenderDates.insert(index, item);
  void updateCalenderDatesAtIndex(int index, Function(String) updateFn) =>
      calenderDates[index] = updateFn(calenderDates[index]);

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

  double? progress;

  double? average;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getStrengthDatesCalender)] action in StrengtGraph widget.
  ApiCallResponse? apiCalenderStrength;
  // Stores action output result for [Backend Call - API (getDailySummaryStrength )] action in StrengtGraph widget.
  ApiCallResponse? strengthResponse;
  // Stores action output result for [Backend Call - API (getEntriesByRangeStrength)] action in StrengtGraph widget.
  ApiCallResponse? apiResultProg;
  // Stores action output result for [Backend Call - API (getStrengthDatesCalender)] action in MyCalendar widget.
  ApiCallResponse? apiResultBottomSheet;
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
