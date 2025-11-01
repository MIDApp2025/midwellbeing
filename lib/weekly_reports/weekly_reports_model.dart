import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'weekly_reports_widget.dart' show WeeklyReportsWidget;
import 'package:flutter/material.dart';

class WeeklyReportsModel extends FlutterFlowModel<WeeklyReportsWidget> {
  ///  Local state fields for this page.

  String? monthlySummery;

  int? month;

  int? yearNumber;

  bool isDataLoaded = false;

  String? weeklySummary;

  int? week;

  double? progressMood;

  double? progressConfidence;

  double? progressStregth;

  double? progresssBelonging;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (weeklyReports)] action in weeklyReports widget.
  ApiCallResponse? apiResultultWeek;
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
