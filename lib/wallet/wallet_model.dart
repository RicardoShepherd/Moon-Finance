import '/components/singlecard_widget.dart';
import '/components/transaction_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_widget.dart' show WalletWidget;
import 'package:flutter/material.dart';

class WalletModel extends FlutterFlowModel<WalletWidget> {
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
