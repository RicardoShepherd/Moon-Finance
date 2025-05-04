import '/components/doughnutchart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'netbalance_widget.dart' show NetbalanceWidget;
import 'package:flutter/material.dart';

class NetbalanceModel extends FlutterFlowModel<NetbalanceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Doughnutchart component.
  late DoughnutchartModel doughnutchartModel;

  @override
  void initState(BuildContext context) {
    doughnutchartModel = createModel(context, () => DoughnutchartModel());
  }

  @override
  void dispose() {
    doughnutchartModel.dispose();
  }
}
