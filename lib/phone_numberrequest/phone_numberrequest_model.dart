import '/flutter_flow/flutter_flow_util.dart';
import 'phone_numberrequest_widget.dart' show PhoneNumberrequestWidget;
import 'package:flutter/material.dart';

class PhoneNumberrequestModel
    extends FlutterFlowModel<PhoneNumberrequestWidget> {
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
