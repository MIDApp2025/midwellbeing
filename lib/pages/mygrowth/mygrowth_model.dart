import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mygrowth_widget.dart' show MygrowthWidget;
import 'package:flutter/material.dart';

class MygrowthModel extends FlutterFlowModel<MygrowthWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseMood  )] action in Mygrowth widget.
  ApiCallResponse? apiResultMood;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseConfidence)] action in Mygrowth widget.
  ApiCallResponse? apiResultConfidence;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseBelonging)] action in Mygrowth widget.
  ApiCallResponse? apiResultBelonging;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseStrength)] action in Mygrowth widget.
  ApiCallResponse? apiResultStrength;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseMood  )] action in Container widget.
  ApiCallResponse? apiResultexists;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseConfidence)] action in Container widget.
  ApiCallResponse? apiResultConfidenc;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseBelonging)] action in Container widget.
  ApiCallResponse? apiResultd2m;
  // Stores action output result for [Backend Call - API (checkDailySummaryTrueFalseStrength)] action in Container widget.
  ApiCallResponse? apiResultbaw;
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
