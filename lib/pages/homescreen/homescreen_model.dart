import '/components/cards_widget.dart';
import '/components/transaction_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homescreen_widget.dart' show HomescreenWidget;
import 'package:flutter/material.dart';

class HomescreenModel extends FlutterFlowModel<HomescreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Cards component.
  late CardsModel cardsModel;
  // Model for TransactionHistory component.
  late TransactionHistoryModel transactionHistoryModel;

  @override
  void initState(BuildContext context) {
    cardsModel = createModel(context, () => CardsModel());
    transactionHistoryModel =
        createModel(context, () => TransactionHistoryModel());
  }

  @override
  void dispose() {
    cardsModel.dispose();
    transactionHistoryModel.dispose();
  }
}
