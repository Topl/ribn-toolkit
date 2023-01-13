// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    required this.onCardPress,
    required this.iconImage,
    required this.shortName,
    this.assetLongName,
    required this.missingAsstDetailsCondition,
    required this.assetQuantityDetails,
    this.firstIcon,
    this.onFirstIconPress,
    this.secondIcon,
    this.onSecondIconPress,
    this.isNft = false,
    Key? key,
  }) : super(key: key);
  final VoidCallback onCardPress;
  final Image iconImage;
  final Text shortName;
  final dynamic assetLongName;
  final bool missingAsstDetailsCondition;
  final Text assetQuantityDetails;
  final Image? firstIcon;
  final VoidCallback? onFirstIconPress;
  final Image? secondIcon;
  final VoidCallback? onSecondIconPress;
  final bool isNft;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: RibnColors.assetCardShadow,
            spreadRadius: 0,
            blurRadius: 37,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        elevation: 0,
        hoverElevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            11.6,
          ),
          side: const BorderSide(color: RibnColors.lightGrey),
        ),
        hoverColor: RibnColors.assetCardHoverColor,
        onPressed: onCardPress,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconImage,
              const SizedBox(width: 20),
              Expanded(
                child: isNft
                    ? _AssetShortName(
                        shortName: shortName,
                      )
                    : _AssetShortName(
                        shortName: shortName,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // display asset units
                  Container(
                    constraints: const BoxConstraints(maxWidth: 90),
                    child: assetQuantityDetails,
                  ),
                  const SizedBox(height: 8),
                  // conditional send and receive buttons
                  firstIcon != null && secondIcon != null
                      ? Row(
                          children: [
                            CustomIconButton(
                              icon: firstIcon!,
                              color: RibnColors.primary,
                              onPressed: onFirstIconPress!,
                            ),
                            const SizedBox(width: 7),
                            CustomIconButton(
                              icon: secondIcon!,
                              color: RibnColors.primary,
                              onPressed: onSecondIconPress!,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssetShortName extends StatelessWidget {
  final Text shortName;

  const _AssetShortName({
    required this.shortName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: shortName,
    );
  }
}
