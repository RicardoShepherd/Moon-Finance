import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  /// State fields for the payment screen
  String amount = '0';
  String selectedCurrency = 'USD';
  bool isProcessing = false;

  /// Text controllers for amount display
  late TextEditingController amountController;
  
  /// Payment status tracking
  bool paymentSuccess = false;
  String? errorMessage;

  @override
  void initState(BuildContext context) {
    amountController = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    amountController.dispose();
  }

  /// Updates the amount with input validation
  void updateAmount(String newValue) {
    if (newValue == 'backspace') {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = '0';
      }
    } else if (newValue == '.') {
      if (!amount.contains('.')) {
        amount = amount + newValue;
      }
    } else {
      // Handle decimal places
      if (amount.contains('.')) {
        var parts = amount.split('.');
        if (parts[1].length < 2) {
          amount = amount + newValue;
        }
      } else {
        // Handle whole numbers
        if (amount == '0') {
          amount = newValue;
        } else {
          amount = amount + newValue;
        }
      }
    }
    
    // Update the text controller
    amountController.text = amount;
  }

  /// Updates the selected currency
  void updateCurrency(String newCurrency) {
    selectedCurrency = newCurrency;
  }

  /// Validates the payment amount
  bool validateAmount() {
    final numericAmount = double.tryParse(amount);
    if (numericAmount == null) return false;
    if (numericAmount <= 0) return false;
    if (numericAmount > 10000) {  // Example maximum limit
      errorMessage = 'Amount exceeds maximum limit of 10,000';
      return false;
    }
    return true;
  }

  /// Processes the payment request
  Future<bool> processPaymentRequest() async {
    if (!validateAmount()) return false;
    
    isProcessing = true;
    try {
      // TODO: Implement actual payment processing logic here
      // This is where you'd integrate with your payment service
      
      await Future.delayed(Duration(seconds: 2)); // Simulated processing
      
      paymentSuccess = true;
      return true;
    } catch (e) {
      errorMessage = 'Payment processing failed: ${e.toString()}';
      paymentSuccess = false;
      return false;
    } finally {
      isProcessing = false;
    }
  }

  /// Processes sending money
  Future<bool> processSendMoney() async {
    if (!validateAmount()) return false;
    
    isProcessing = true;
    try {
      // TODO: Implement actual money sending logic here
      // This is where you'd integrate with your payment service
      
      await Future.delayed(Duration(seconds: 2)); // Simulated processing
      
      paymentSuccess = true;
      return true;
    } catch (e) {
      errorMessage = 'Send money failed: ${e.toString()}';
      paymentSuccess = false;
      return false;
    } finally {
      isProcessing = false;
    }
  }

  /// Resets the payment form
  void resetForm() {
    amount = '0';
    amountController.text = '0';
    errorMessage = null;
    paymentSuccess = false;
    isProcessing = false;
  }
}