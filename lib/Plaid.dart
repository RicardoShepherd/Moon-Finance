import 'package:plaid/plaid.dart';
import 'dart:io';

class PlaidClient {
  static final PlaidApi _plaidApi = PlaidApi(
    Configuration(
      basePath: PlaidEnvironments.sandbox,
      baseOptions: BaseOptions(
        headers: {
          'PLAID-CLIENT-ID': Platform.environment['PLAID_CLIENT_ID']!,
          'PLAID-SECRET': Platform.environment['PLAID_SECRET']!,
        },
      ),
    ),
  );

  static PlaidApi get client => _plaidApi;
}
  