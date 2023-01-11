// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';

/// A custom display for asset information.
class AssetInfo extends StatelessWidget {
  /// AssetCode for which information needs to be displayed.
  final dynamic assetCode;

  final Map? formattedAsset;

  const AssetInfo({
    Key? key,
    required this.assetCode,
    this.formattedAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// True if [assetCode] is null.
    final bool assetNotSelected = assetCode == null;

    /// Default text to be displayed if no asset been selected.
    const Text defaultText = Text(
      'Choose Asset',
      style: TextStyle(
        color: Color(0xff6d6d6d),
        fontWeight: FontWeight.w600,
        fontFamily: 'DM Sans',
        fontStyle: FontStyle.normal,
        fontSize: 12.0,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: 19,
            height: 19,
            child: assetNotSelected
                ? Image.asset(RibnAssets.unselectedAsset)
                : Image.asset(
                    formattedAsset!['assetIcon'] ?? RibnAssets.undefinedIcon),
          ),
        ),
        assetNotSelected
            ? defaultText
            : SizedBox(
                height: 19,
                width: 154,
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 75),
                      child: Text(
                        formattedAsset!['longName'] ?? '',
                        style: const TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: RibnColors.defaultText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: RibnColors.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        formattedAsset!['shortName']!,
                        style: const TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          color: RibnColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
