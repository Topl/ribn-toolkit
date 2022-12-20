import 'dart:convert';
import 'dart:ui';

import 'package:ribn_toolkit/models/transactions/ribn_activity_details_model.dart';

import 'colors.dart';

class RibnSampleDataModels {
  RibnSampleDataModels._();
  static RibnActivityDetailsModel activityDetailsModel =
      RibnActivityDetailsModel.fromJson(jsonEncode({
    "securityRoot": null,
    "isPolyTransaction": true,
    "transactionType": "Sent",
    "timestamp": "11-03-2022",
    "assetDetails": {},
    "icon": "assets/icons/poly_icon_circle.png",
    "shortName": "POLY",
    "transactionStatus": "confirmed",
    "transactionAmount": -2022,
    "fee": "0 nanoPOLYs",
    "myRibnWalletAddress": formatAddressString(
        "AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D",
        charsToDisplay: 4),
    "transactionSenderAddress": formatAddressString(
        "AUEy8qDHaFvcD7SF52pbzmvApVwJ3ijgxNBgbPwWcorZKHF1Mwy3",
        charsToDisplay: 4),
    "note": null,
    "blockId": formatAddressString(
        "29hEG5XFQEFgnYrqTEfnhcwjrdLwVZ3gDkmEqPmMKwo6y",
        charsToDisplay: 4),
    "blockHeight": 623879,
    "transactionId": formatAddressString(
        "iQqkwJHks5642E8gm5XsDiovcFpmgWt5XveM1RdiEubz",
        charsToDisplay: 4),
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
