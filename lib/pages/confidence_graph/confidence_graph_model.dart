import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confidence_graph_widget.dart' show ConfidenceGraphWidget;
import 'package:flutter/material.dart';

class ConfidenceGraphModel extends FlutterFlowModel<ConfidenceGraphWidget> {
  ///  Local state fields for this page.

  String? confidenceText;

  String? currentMonthStart;

  String? currentMonthEnd;

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

  String? formattedStartDate;

  String? formattedEndDate;

  List<DateTime> markedDatesForCalendar2 = [];
  void addToMarkedDatesForCalendar2(DateTime item) =>
      markedDatesForCalendar2.add(item);
  void removeFromMarkedDatesForCalendar2(DateTime item) =>
      markedDatesForCalendar2.remove(item);
  void removeAtIndexFromMarkedDatesForCalendar2(int index) =>
      markedDatesForCalendar2.removeAt(index);
  void insertAtIndexInMarkedDatesForCalendar2(int index, DateTime item) =>
      markedDatesForCalendar2.insert(index, item);
  void updateMarkedDatesForCalendar2AtIndex(
          int index, Function(DateTime) updateFn) =>
      markedDatesForCalendar2[index] = updateFn(markedDatesForCalendar2[index]);

  DateTime? selectedConfidenceDay;

  String? dialogTitle;

  String? dialogMessage;

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

  List<String> rawCalendarDates = [];
  void addToRawCalendarDates(String item) => rawCalendarDates.add(item);
  void removeFromRawCalendarDates(String item) => rawCalendarDates.remove(item);
  void removeAtIndexFromRawCalendarDates(int index) =>
      rawCalendarDates.removeAt(index);
  void insertAtIndexInRawCalendarDates(int index, String item) =>
      rawCalendarDates.insert(index, item);
  void updateRawCalendarDatesAtIndex(int index, Function(String) updateFn) =>
      rawCalendarDates[index] = updateFn(rawCalendarDates[index]);

  List<String> markedYmdDates = [];
  void addToMarkedYmdDates(String item) => markedYmdDates.add(item);
  void removeFromMarkedYmdDates(String item) => markedYmdDates.remove(item);
  void removeAtIndexFromMarkedYmdDates(int index) =>
      markedYmdDates.removeAt(index);
  void insertAtIndexInMarkedYmdDates(int index, String item) =>
      markedYmdDates.insert(index, item);
  void updateMarkedYmdDatesAtIndex(int index, Function(String) updateFn) =>
      markedYmdDates[index] = updateFn(markedYmdDates[index]);

  List<String> calendarDates = [];
  void addToCalendarDates(String item) => calendarDates.add(item);
  void removeFromCalendarDates(String item) => calendarDates.remove(item);
  void removeAtIndexFromCalendarDates(int index) =>
      calendarDates.removeAt(index);
  void insertAtIndexInCalendarDates(int index, String item) =>
      calendarDates.insert(index, item);
  void updateCalendarDatesAtIndex(int index, Function(String) updateFn) =>
      calendarDates[index] = updateFn(calendarDates[index]);

  /// kalenterin väliin
  bool isExpande = true;

  String calendarFormat = 'CalendarFormat.twoWeeks';

  CalendarView? calenderView = CalendarView.month;

  String? selectedSummary;

  List<dynamic> selectedCalenderItem = [];
  void addToSelectedCalenderItem(dynamic item) =>
      selectedCalenderItem.add(item);
  void removeFromSelectedCalenderItem(dynamic item) =>
      selectedCalenderItem.remove(item);
  void removeAtIndexFromSelectedCalenderItem(int index) =>
      selectedCalenderItem.removeAt(index);
  void insertAtIndexInSelectedCalenderItem(int index, dynamic item) =>
      selectedCalenderItem.insert(index, item);
  void updateSelectedCalenderItemAtIndex(
          int index, Function(dynamic) updateFn) =>
      selectedCalenderItem[index] = updateFn(selectedCalenderItem[index]);

  String? selectedDay;

  double? progress;

  double? average;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getConfidenceDatesCalender )] action in ConfidenceGraph widget.
  ApiCallResponse? calenderload;
  // Stores action output result for [Backend Call - API (getDailySummaryConfidence)] action in ConfidenceGraph widget.
  ApiCallResponse? confidenceResponse;
  // Stores action output result for [Backend Call - API (getEntriesByRangeConfidence )] action in ConfidenceGraph widget.
  ApiCallResponse? apiResultProg;
  // Stores action output result for [Backend Call - API (getConfidenceDatesCalender )] action in MyCalendar widget.
  ApiCallResponse? apiResultp8y;
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
