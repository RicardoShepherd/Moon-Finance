import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'allcards_widget.dart' show AllcardsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AllcardsModel extends FlutterFlowModel<AllcardsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
