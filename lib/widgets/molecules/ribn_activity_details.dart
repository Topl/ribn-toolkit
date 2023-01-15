import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribn_toolkit/widgets/molecules/ribn_tx_history_data_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/ribn_sample_data_models.dart';
import '../../constants/rules.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../../models/transactions/ribn_activity_details_model.dart';
import '../atoms/custom_copy_button.dart';
import '../atoms/seperators/ribn_dashed_line.dart';
import '../atoms/status_chip.dart';
import '../organisms/custom_page_text_title.dart';

class RibnActivityDetails extends StatelessWidget {
  final RibnActivityDetailsModel activityDetails;
  final TextStyle dataTileTextStyle;
  const RibnActivityDetails(
      {Key? key,
      required this.activityDetails,
      required this.dataTileTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const CustomPageTextTitle(
            title: Strings.transactionDetails,
            hideCloseCross: false,
            hideBackArrow: true),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.6),
              color: RibnColors.whiteBackground,
              border: Border.all(color: RibnColors.lightGrey, width: 1),
              boxShadow: const [
                BoxShadow(
                  color: RibnColors.greyShadow,
                  spreadRadius: 0,
                  blurRadius: 37.5,
                  offset: Offset(0, -6),
                ),
              ],
            ),
            child: Container(
              color: RibnColors.whiteColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Transaction Type',
                        tileValue: Text(
                          activityDetails.transactionType,
                          style: dataTileTextStyle,
                        ),
                      ),
                      RibnTxHistoryDataTile(
                        reducedWidth: true,
                        tileTitle: 'Timestamp',
                        tileValue: Text(
                          activityDetails.timestamp,
                          style: dataTileTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Asset name',
                        tileValue: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                activityDetails.icon,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                activityDetails.shortName,
                                style: dataTileTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RibnTxHistoryDataTile(
                        reducedWidth: true,
                        tileTitle: 'Amount',
                        tileValue: Text(
                          activityDetails.transactionAmount!,
                          style: dataTileTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Status',
                        tileValue: StatusChip(
                          status: activityDetails.transactionStatus,
                        ),
                      ),
                      RibnTxHistoryDataTile(
                        reducedWidth: true,
                        tileTitle: 'Fee',
                        tileValue: Text(
                          activityDetails.fee,
                          style: dataTileTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  RibnTxHistoryDataTile(
                    tileTitle: 'From',
                    tileValue: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 26,
                          height: 26,
                          child:
                              SvgPicture.asset(RibnAssets.recipientFingerprint),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            formatAddressString(
                                activityDetails.transactionSenderAddress,
                                charsToDisplay: 4),
                            style: dataTileTextStyle,
                          ),
                        ),
                        CustomCopyButton(
                          textToBeCopied:
                              activityDetails.transactionSenderAddress,
                          icon: Image.asset(
                            RibnAssets.copyIcon,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  RibnTxHistoryDataTile(
                    tileTitle: 'To',
                    tileValue: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 26,
                          height: 26,
                          child: SvgPicture.asset(RibnAssets.myFingerprint),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            formatAddressString(
                                activityDetails.myRibnWalletAddress,
                                charsToDisplay: 4),
                            style: dataTileTextStyle,
                          ),
                        ),
                        CustomCopyButton(
                          textToBeCopied: activityDetails.myRibnWalletAddress,
                          icon: Image.asset(
                            RibnAssets.copyIcon,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Note',
                        tileValue: Text(
                          activityDetails.note,
                          style: dataTileTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RibnTxHistoryDataTile(
                            tileTitle: 'Security root',
                            tileValue: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    activityDetails.securityRoot.isNotEmpty
                                        ? formatAddressString(
                                            activityDetails.securityRoot,
                                            charsToDisplay: 4)
                                        : "",
                                    style: dataTileTextStyle,
                                  ),
                                ),
                                if (activityDetails.securityRoot.isNotEmpty)
                                  CustomCopyButton(
                                    textToBeCopied:
                                        activityDetails.securityRoot,
                                    icon: Image.asset(
                                      RibnAssets.copyIcon,
                                      width: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const RibnDashedLine(color: RibnColors.lightGreyDivider),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Block ID',
                        tileValue: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                formatAddressString(activityDetails.blockId,
                                    charsToDisplay: 4),
                                style: dataTileTextStyle,
                              ),
                            ),
                            CustomCopyButton(
                              textToBeCopied: activityDetails.blockId,
                              icon: Image.asset(
                                RibnAssets.copyIcon,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RibnTxHistoryDataTile(
                        reducedWidth: true,
                        tileTitle: 'Block height',
                        tileValue: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                activityDetails.blockHeight.toString(),
                                style: dataTileTextStyle,
                              ),
                            ),
                            CustomCopyButton(
                              textToBeCopied:
                                  activityDetails.blockHeight.toString(),
                              icon: Image.asset(
                                RibnAssets.copyIcon,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        tileTitle: 'Transaction ID',
                        tileValue: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                formatAddressString(
                                    activityDetails.transactionId,
                                    charsToDisplay: 4),
                                style: dataTileTextStyle,
                              ),
                            ),
                            CustomCopyButton(
                              textToBeCopied: activityDetails.transactionId,
                              icon: Image.asset(
                                RibnAssets.copyIcon,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RibnDashedLine(color: RibnColors.lightGreyDivider),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RibnTxHistoryDataTile(
                        reducedWidth: true,
                        tileTitle: 'View on Topl Explorer',
                        tileValue: _buildToplExplorerLink(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  RichText _buildToplExplorerLink() {
    final url = Uri.parse(
      '${Rules.txDetailsRedirectUrls[activityDetails.networkId] ?? ''}${activityDetails.transactionId}',
    );

    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () async => await launchUrl(url),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'www.topl.explorer',
                    style: RibnToolkitTextStyles.h4.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: RibnColors.tertiary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFF9F9F9),
                    ),
                    child: Image.asset(
                      RibnAssets.openInNewWindow,
                      width: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
