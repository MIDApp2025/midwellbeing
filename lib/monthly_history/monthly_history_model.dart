import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'monthly_history_widget.dart' show MonthlyHistoryWidget;
import 'package:flutter/material.dart';

class MonthlyHistoryModel extends FlutterFlowModel<MonthlyHistoryWidget> {
  ///  Local state fields for this page.

  String? monthlySummery;

  int? month;

  int? year;

  bool isDataLoaded = false;

  double? progMood;

  double? progStrength;

  double? progConfidence;

  double? progBelonging;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (monthly summary)] action in monthlyHistory widget.
  ApiCallResponse? apiResultMonthlyHistory;
  // Stores action output result for [Backend Call - API (reportMonthHistory)] action in Column widget.
  ApiCallResponse? apiResultmonth;
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
