import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'page_little_widget.dart' show PageLittleWidget;
import 'package:flutter/material.dart';

class PageLittleModel extends FlutterFlowModel<PageLittleWidget> {
  ///  Local state fields for this page.

  int? currentIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
