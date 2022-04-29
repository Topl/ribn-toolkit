import 'package:flutter/material.dart';
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
    required this.firstIcon,
    required this.onFirstIconPress,
    required this.secondIcon,
    required this.onSecondIconPress,
    Key? key,
  }) : super(key: key);
  final VoidCallback onCardPress;
  final Image iconImage;
  final Text shortName;
  final dynamic assetLongName;
  final bool missingAsstDetailsCondition;
  final Text assetQuantityDetails;
  final Image firstIcon;
  final VoidCallback onFirstIconPress;
  final Image secondIcon;
  final VoidCallback onSecondIconPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(RibnColors.whiteBackground),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        fixedSize: MaterialStateProperty.all(const Size(309, 88)),
      ),
      onPressed: onCardPress,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // display asset icon
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 11, right: 16),
            child: iconImage,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // display asset short name
              SizedBox(
                width: 120,
                child: shortName,
              ),
              // display asset long name or placeholder if no long name exists
              Padding(padding: const EdgeInsets.symmetric(vertical: 5.0), child: assetLongName),
              // display helpful text if some asset details are missing
              missingAsstDetailsCondition
                  ? const Text(
                      'Add Asset Details',
                      style: TextStyle(
                        color: RibnColors.primary,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DM Sans',
                        fontStyle: FontStyle.normal,
                        fontSize: 10.4,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // display asset units
              Container(constraints: const BoxConstraints(maxWidth: 90), child: assetQuantityDetails),
              const SizedBox(height: 8),
              // send and receive buttons
              Row(
                children: [
                  CustomIconButton(
                    icon: firstIcon,
                    color: RibnColors.primary,
                    onPressed: onFirstIconPress,
                  ),
                  const SizedBox(width: 7),
                  CustomIconButton(
                    icon: secondIcon,
                    color: RibnColors.primary,
                    onPressed: onSecondIconPress,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
