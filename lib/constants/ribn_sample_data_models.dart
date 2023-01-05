import 'dart:convert';

import 'package:ribn_toolkit/models/transactions/ribn_activity_details_model.dart';


class RibnSampleDataModels {
  RibnSampleDataModels._();
  static RibnActivityDetailsModel activityDetailsModel =
      RibnActivityDetailsModel.fromJson(jsonEncode({
    "securityRoot": "11111111111111111111111111111111",
    "isPolyTransaction": true,
    "transactionType": "Sent",
    "timestamp": "11-03-2022",
    "assetDetails": {"unit": "-2022"},
    "icon": "assets/icons/poly_icon_circle.png",
    "shortName": "POLY",
    "transactionStatus": "confirmed",
    "transactionAmount": -2022,
    "fee": "0 nanoPOLYs",
    "myRibnWalletAddress":
        "AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D",
    "transactionSenderAddress":
        "AUEy8qDHaFvcD7SF52pbzmvApVwJ3ijgxNBgbPwWcorZKHF1Mwy3",
    "note": null,
    "blockId": "29hEG5XFQEFgnYrqTEfnhcwjrdLwVZ3gDkmEqPmMKwo6y",
    "blockHeight": 623879,
    "transactionId": "iQqkwJHks5642E8gm5XsDiovcFpmgWt5XveM1RdiEubz",
    "networkId": 64
  }));
}

/// Formats an address string to only dispaly its first and last 10 characters.
String formatAddressString(String addr, {int charsToDisplay = 10}) {
  const numDots = 3;
  final String dotsString = List<String>.filled(numDots, '.').join();
  final String leftSubstring = addr.substring(0, charsToDisplay);
  final String rightSubstring = addr.substring(addr.length - charsToDisplay);
  return '$leftSubstring$dotsString$rightSubstring';
}
