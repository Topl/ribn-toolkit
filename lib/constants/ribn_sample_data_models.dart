// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:ribn_toolkit/models/transactions/ribn_activity_details_model.dart';

class RibnSampleDataModels {
  RibnSampleDataModels._();
  static RibnActivityDetailsModel activityDetailsModel =
      RibnActivityDetailsModel.fromJson(jsonEncode({
    "securityRoot": formatAddressString("11111111111111111111111111111111", charsToDisplay: 4),
    "isPolyTransaction": true,
    "transactionType": "Sent",
    "timestamp": "11-03-2022",
    "assetDetails": {"unit": "-2022"},
    "icon": "assets/icons/poly_icon_circle.png",
    "shortName": "POLY",
    "transactionStatus": "confirmed",
    "transactionAmount": -2022,
    "fee": "0 POLY",
    "myRibnWalletAddress": formatAddressString(
        "AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D",
        charsToDisplay: 4),
    "transactionSenderAddress": formatAddressString(
        "AUEy8qDHaFvcD7SF52pbzmvApVwJ3ijgxNBgbPwWcorZKHF1Mwy3",
        charsToDisplay: 4),
    "note": null,
    "blockId":
        formatAddressString("29hEG5XFQEFgnYrqTEfnhcwjrdLwVZ3gDkmEqPmMKwo6y", charsToDisplay: 4),
    "blockHeight": 623879,
    "transactionId":
        formatAddressString("iQqkwJHks5642E8gm5XsDiovcFpmgWt5XveM1RdiEubz", charsToDisplay: 4),
    "networkId": 64
  }));
  static Map rawTx = {
    "rawTx": {
      "txType": "AssetTransfer",
      "timestamp": 1669127521776,
      "signatures": {},
      "newBoxes": [
        {
          "nonce": "-2558585942015307795",
          "id": "H8MTNNrfPGzjhcB2CuBW1EqacFfqY3gQa7VmGY2UP9r6",
          "evidence": "TBqQD6SqgYKaxDeeSYDbtbXcBoiZmNY6aM7A5eEoCb71",
          "type": "PolyBox",
          "value": {"type": "Simple", "quantity": "900"}
        },
        {
          "nonce": "-758631546806837569",
          "id": "CxMAuqdgcyR1Y9FPcw2bx827QUFNAHLqXHVCzErmGx2p",
          "evidence": "Prvi2mHGH9yPZC1SWKBSKuy5wBAzizgpBRVu2RQ5Tkw5",
          "type": "AssetBox",
          "value": {
            "quantity": "1",
            "assetCode": "6LmeEK9tv2WtRB2jaEU5fKmU3RwFRvRQdSWkWJzgs6y2E1t2n8gBiqjt3q",
            "metadata": null,
            "type": "Asset",
            "securityRoot": "11111111111111111111111111111111"
          }
        }
      ],
      "data": null,
      "from": [
        ["AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D", "-6424342642950537789"],
        ["AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D", "3296914010111945238"]
      ],
      "minting": false,
      "txId": "hQeTrS1tCM9MQm3nyoEg5K1MTRuxpuse49KRom53BWVW",
      "boxesToRemove": [
        "GiMr291wTmBVU7bTPhKeSosR5U5ygiLnwc3ETPh5w92e",
        "4AD8YFV342VmYs1gyGTLxg2H92uunFiQDHwRcm9kjMuD"
      ],
      "fee": "100",
      "to": [
        [
          "AUAJx3fy1YrrPb4SPNJjL1EMuLhpZWMz8guqYYkMXGSYUSNNTGTZ",
          {"type": "Simple", "quantity": "900"}
        ],
        [
          "AU9wBip3bEkFtCvamM8pTJZBr7mRvhv9JuLgozngnayP2i1HmGAT",
          {
            "quantity": "1",
            "assetCode": "6LmeEK9tv2WtRB2jaEU5fKmU3RwFRvRQdSWkWJzgs6y2E1t2n8gBiqjt3q",
            "metadata": null,
            "type": "Asset",
            "securityRoot": "11111111111111111111111111111111"
          }
        ]
      ],
      "propositionType": "PublicKeyCurve25519"
    },
    "txType": "AssetTransfer",
    "timestamp": 1669127521776,
    "signatures": {},
    "newBoxes": [
      {
        "nonce": "-2558585942015307795",
        "id": "H8MTNNrfPGzjhcB2CuBW1EqacFfqY3gQa7VmGY2UP9r6",
        "evidence": "TBqQD6SqgYKaxDeeSYDbtbXcBoiZmNY6aM7A5eEoCb71",
        "type": "PolyBox",
        "value": {"type": "Simple", "quantity": "900"}
      },
      {
        "nonce": "-758631546806837569",
        "id": "CxMAuqdgcyR1Y9FPcw2bx827QUFNAHLqXHVCzErmGx2p",
        "evidence": "Prvi2mHGH9yPZC1SWKBSKuy5wBAzizgpBRVu2RQ5Tkw5",
        "type": "AssetBox",
        "value": {
          "quantity": "1",
          "assetCode": "6LmeEK9tv2WtRB2jaEU5fKmU3RwFRvRQdSWkWJzgs6y2E1t2n8gBiqjt3q",
          "metadata": null,
          "type": "Asset",
          "securityRoot": "11111111111111111111111111111111"
        }
      }
    ],
    "data": null,
    "from": [
      ["AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D", "-6424342642950537789"],
      ["AUDxRxPtWPeejAMfEeYMYfwQ7Shk5qLw4swZkW6sek3D4FMDrQ6D", "3296914010111945238"]
    ],
    "minting": false,
    "txId": "hQeTrS1tCM9MQm3nyoEg5K1MTRuxpuse49KRom53BWVW",
    "boxesToRemove": [
      "GiMr291wTmBVU7bTPhKeSosR5U5ygiLnwc3ETPh5w92e",
      "4AD8YFV342VmYs1gyGTLxg2H92uunFiQDHwRcm9kjMuD"
    ],
    "fee": "100",
    "to": [
      [
        "AUAJx3fy1YrrPb4SPNJjL1EMuLhpZWMz8guqYYkMXGSYUSNNTGTZ",
        {"type": "Simple", "quantity": "900"}
      ],
      [
        "AU9wBip3bEkFtCvamM8pTJZBr7mRvhv9JuLgozngnayP2i1HmGAT",
        {
          "quantity": "1",
          "assetCode": "6LmeEK9tv2WtRB2jaEU5fKmU3RwFRvRQdSWkWJzgs6y2E1t2n8gBiqjt3q",
          "metadata": null,
          "type": "Asset",
          "securityRoot": "11111111111111111111111111111111"
        }
      ]
    ],
    "propositionType": "PublicKeyCurve25519",
    "messageToSign":
        "2chzR3CYT5kUh946yCeJV87uXryy5CdFkkjxMFVK1wzSSGeazDpoxvVeLYub9Q3ZfJ4B5FYt6EQca9dTrWZYUdnssTcssiZEsdLGExaA3K4tSSaqqhvsUYasKvHJaUcSEdBHaJk4zwnY3CYEFZntDqA6UV6PzorMSZafsqK2BH8qe7LPpLmP4vxveacnQ1ZKk2Spz1kyKuJAMAdALqyFANqgTggrtQt4D8skmJ81PKCvFN72BHN2wtqzKNVFREVU6d1xdaJFipMaM2UG4HrvpSqqPC1CxAiCkdzjwcP3nmKR5vz3iCY9Vh8nBv9YyjTwmQbrCgsuRzJUNF1MhfYRjtQqsJ8wxBhSKyL13JcmQJYcdmtiXzHK58LA5AHrcxaUdtA4w"
  };
  static List<String> dappList = <String>[
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi",
    "refiworld.refi"
  ];
}

/// Formats an address string to only dispaly its first and last 10 characters.
String formatAddressString(String addr, {int charsToDisplay = 10}) {
  const numDots = 3;
  final String dotsString = List<String>.filled(numDots, '.').join();
  final String leftSubstring = addr.substring(0, charsToDisplay);
  final String rightSubstring = addr.substring(addr.length - charsToDisplay);
  return '$leftSubstring$dotsString$rightSubstring';
}
