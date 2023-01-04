import 'dart:convert';
import 'dart:ui';
import 'package:ribn_toolkit/constants/assets.dart';

import '../assets/ribn_asset_details_model.dart';

class RibnActivityDetailsModel {
  RibnActivityDetailsModel({
    required this.isPolyTransaction,
    required this.transactionType,
    required this.timestamp,
    required this.assetDetails,
    required this.icon,
    required this.shortName,
    required this.transactionStatus,
    required this.transactionAmount,
    required this.fee,
    required this.myRibnWalletAddress,
    required this.transactionSenderAddress,
    required this.note,
    required this.blockId,
    required this.blockHeight,
    required this.transactionId,
    required this.networkId,
    required this.securityRoot,
  });
  final bool isPolyTransaction;
  final String transactionType;
  final String timestamp;
  final RibnAssetDetails assetDetails;
  final String icon;
  final String shortName;
  final String transactionStatus;
  final String transactionAmount;
  final String fee;
  final String myRibnWalletAddress;
  final String transactionSenderAddress;
  final dynamic note;
  final String blockId;
  final int blockHeight;
  final String transactionId;
  final int networkId;
  final String securityRoot;

  factory RibnActivityDetailsModel.fromJson(String str) =>
      RibnActivityDetailsModel.fromMap(json.decode(str));
  factory RibnActivityDetailsModel.fromMap(Map<String, dynamic> json) =>
      RibnActivityDetailsModel(
        isPolyTransaction: json["isPolyTransaction"] ?? false,
        transactionType: json["transactionType"] ?? "",
        timestamp: json["timestamp"] ?? "",
        assetDetails: RibnAssetDetails.fromMap(json["assetDetails"]),
        icon: json["icon"] ?? RibnAssets.undefinedIcon,
        shortName: json["shortName"] ?? "",
        transactionStatus: json["transactionStatus"] ?? "",
        transactionAmount: json["transactionAmount"].toString() ?? "",
        fee: json["fee"] ?? "0",
        myRibnWalletAddress: json["myRibnWalletAddress"] ?? "",
        transactionSenderAddress: json["transactionSenderAddress"] ?? "",
        note: json["note"] ?? "",
        blockId: json["blockId"] ?? "",
        blockHeight: json["blockHeight"] ?? -1,
        transactionId: json["transactionId"] ?? "",
        networkId: json["networkId"] ?? -1,
        securityRoot: json["securityRoot"] ?? "",
      );
}
