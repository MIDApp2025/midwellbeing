import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'maikki_widget.dart' show MaikkiWidget;
import 'package:flutter/material.dart';

class MaikkiModel extends FlutterFlowModel<MaikkiWidget> {
  ///  Local state fields for this page.

  String? selectedTestId;

  double? progressMood;

  double? progressDicessions;

  double? progressBelonging;

  double? progressGrowth;

  double? progressWork;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getCategoryProgressMoodAndFeelings)] action in Maikki widget.
  ApiCallResponse? apiResultFeelingsAndMood;
  // Stores action output result for [Backend Call - API (getCategoryProgressThinkingAndDecisions)] action in Maikki widget.
  ApiCallResponse? apiResultThinkingAndDecisions;
  // Stores action output result for [Backend Call - API (getCategoryProgressConnectionAndBelonging  )] action in Maikki widget.
  ApiCallResponse? apiResultConnectionAndBelonging;
  // Stores action output result for [Backend Call - API (getCategoryProgressGrowthAndStrength)] action in Maikki widget.
  ApiCallResponse? apiResultGrowthAndStrength;
  // Stores action output result for [Backend Call - API (getCategoryProgressWorkandwellbeing)] action in Maikki widget.
  ApiCallResponse? apiResultWorkandwellbeing;
  // State field(s) for DropDownMood widget.
  String? dropDownMoodValue;
  FormFieldController<String>? dropDownMoodValueController;
  // State field(s) for DropDownThinking widget.
  String? dropDownThinkingValue;
  FormFieldController<String>? dropDownThinkingValueController;
  // State field(s) for DropDownBelong widget.
  String? dropDownBelongValue;
  FormFieldController<String>? dropDownBelongValueController;
  // State field(s) for DropDownGrowth widget.
  String? dropDownGrowthValue;
  FormFieldController<String>? dropDownGrowthValueController;
  // State field(s) for DropDownWork widget.
  String? dropDownWorkValue;
  FormFieldController<String>? dropDownWorkValueController;
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
