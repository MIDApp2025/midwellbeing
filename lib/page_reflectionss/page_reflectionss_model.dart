import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'page_reflectionss_widget.dart' show PageReflectionssWidget;
import 'package:flutter/material.dart';

class PageReflectionssModel extends FlutterFlowModel<PageReflectionssWidget> {
  ///  Local state fields for this page.

  int? currentIndex;

  String? widgetId;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Stores action output result for [Backend Call - API (getSingleProgramCoach)] action in ExerciseCard widget.
  ApiCallResponse? apiOntapWiget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
