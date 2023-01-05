import 'package:flutter/cupertino.dart';

import '../../constants/assets.dart';
import '../../constants/styles.dart';
import '../atoms/status_chip.dart';

class RibnActivityTile extends StatelessWidget {
  final Color tileColor;
  final String assetIcon;
  final String assetBalance;
  final String assetShortName;
  final String transactionStatus;
  final String transactionDate;
  final VoidCallback onTap;
  const RibnActivityTile(
      {Key? key,
      required this.tileColor,
      required this.assetIcon,
      required this.assetBalance,
      required this.assetShortName,
      required this.transactionStatus,
      required this.transactionDate,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: tileColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: renderAssetIcon(assetIcon),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              assetBalance,
                              style: RibnToolkitTextStyles.extH3
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              assetShortName,
                              style: RibnToolkitTextStyles.assetLongNameStyle
                                  .copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatusChip(status: transactionStatus),
                      Text(
                        transactionDate,
                        style: RibnToolkitTextStyles.assetLongNameStyle
                            .copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }

  Image renderAssetIcon(assetDetailsIcon) {
    return assetDetailsIcon == null
        ? Image.asset(RibnAssets.undefinedIcon)
        : Image.asset(
            assetDetailsIcon!,
          );
  }

  Image renderPolyIcon() {
    return Image.asset(RibnAssets.polyIconCircle);
  }
}
