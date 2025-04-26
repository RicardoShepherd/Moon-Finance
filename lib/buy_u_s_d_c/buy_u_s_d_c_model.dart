import '/flutter_flow/flutter_flow_util.dart';
import 'buy_u_s_d_c_widget.dart' show BuyUSDCWidget;
import 'package:flutter/material.dart';

class BuyUSDCModel extends FlutterFlowModel<BuyUSDCWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
