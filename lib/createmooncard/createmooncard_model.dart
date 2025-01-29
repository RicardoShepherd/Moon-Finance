import '/components/mooncreditcardaccept_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'createmooncard_widget.dart' show CreatemooncardWidget;
import 'package:flutter/material.dart';

class CreatemooncardModel extends FlutterFlowModel<CreatemooncardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for mooncreditcardaccept component.
  late MooncreditcardacceptModel mooncreditcardacceptModel;

  @override
  void initState(BuildContext context) {
    mooncreditcardacceptModel =
        createModel(context, () => MooncreditcardacceptModel());
  }

  @override
  void dispose() {
    mooncreditcardacceptModel.dispose();
  }
}
