import '/flutter_flow/flutter_flow_util.dart';
import 'linkyourbankaccount_widget.dart' show LinkyourbankaccountWidget;
import 'package:flutter/material.dart';

class LinkyourbankaccountModel
    extends FlutterFlowModel<LinkyourbankaccountWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode1;
  TextEditingController? emailAddressLoginTextController1;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextController1Validator;
  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode2;
  TextEditingController? emailAddressLoginTextController2;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressLoginFocusNode1?.dispose();
    emailAddressLoginTextController1?.dispose();

    emailAddressLoginFocusNode2?.dispose();
    emailAddressLoginTextController2?.dispose();
  }
}
