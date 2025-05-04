import '/components/singlecard_widget.dart';
import '/components/transaction_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Singlecard component.
  late SinglecardModel singlecardModel;
  // Model for TransactionHistory component.
  late TransactionHistoryModel transactionHistoryModel;

  @override
  void initState(BuildContext context) {
    singlecardModel = createModel(context, () => SinglecardModel());
    transactionHistoryModel =
        createModel(context, () => TransactionHistoryModel());
  }

  @override
  void dispose() {
    singlecardModel.dispose();
    transactionHistoryModel.dispose();
  }
}
