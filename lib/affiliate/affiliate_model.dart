import '/components/sharemoon_affiliate_widget.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'affiliate_widget.dart' show AffiliateWidget;
import 'package:flutter/material.dart';

class AffiliateModel extends FlutterFlowModel<AffiliateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Main Loop',
    'Intro',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  // Model for sharemoonAffiliate component.
  late SharemoonAffiliateModel sharemoonAffiliateModel;

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    }

    sharemoonAffiliateModel =
        createModel(context, () => SharemoonAffiliateModel());
  }

  @override
  void dispose() {
    sharemoonAffiliateModel.dispose();
  }
}
