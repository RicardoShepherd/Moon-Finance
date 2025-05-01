import '/flutter_flow/flutter_flow_util.dart';
import 'invoices_widget.dart' show InvoicesWidget;
import 'package:flutter/material.dart';

class InvoicesModel extends FlutterFlowModel<InvoicesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
