import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'getting_started_widget.dart' show GettingStartedWidget;
import 'package:flutter/material.dart';

class GettingStartedModel extends FlutterFlowModel<GettingStartedWidget> {
  ///  Local state fields for this page.

  String? currentQuote;

  String? timeZoneFunkt;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDeviceTimeZone1] action in GettingStarted widget.
  String? timezone1;
  // Stores action output result for [Custom Action - getRandomQuoteFI] action in GettingStarted widget.
  String? quoteFi;
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
