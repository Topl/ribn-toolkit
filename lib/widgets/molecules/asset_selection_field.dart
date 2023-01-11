// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/asset_info.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_dropdown.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';

/// An input field used on the [MintInputPage] and [AssetTransferInputPage].
///
/// Allows the user to select from a dropdown of existing assets in the wallet.
class AssetSelectionField extends StatefulWidget {
  /// Currently selected asset formatted for UI consumption.
  final Map? formattedSelectedAsset;

  /// Locally stored asset details formatted for UI consumption.
  final dynamic formattedAsset;

  /// List of assets in the wallet.
  final List assets;

  /// Handler for when an asset is selected.
  final Function onSelected;

  /// The label to be displayed with the dropdown.
  final String label;

  /// The icon to trigger the tooltip for CustomInputField
  final Image tooltipIcon;

  /// Chevron icon to display at the end of the input field
  final Image? chevronIcon;

  const AssetSelectionField({
    Key? key,
    this.formattedSelectedAsset,
    this.formattedAsset,
    required this.assets,
    required this.onSelected,
    this.label = 'Remint',
    required this.tooltipIcon,
    required this.chevronIcon,
  }) : super(key: key);

  @override
  _AssetSelectionFieldState createState() => _AssetSelectionFieldState();
}

class _AssetSelectionFieldState extends State<AssetSelectionField> {
  /// True if asset dropdown needs to be displayed.
  bool showAssetDropdown = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      itemLabel: widget.label,
      tooltipIcon: widget.tooltipIcon,
      item: CustomDropDown(
        childAlignment: Alignment.bottomLeft,
        dropDownAlignment: Alignment.topLeft,
        visible: showAssetDropdown,
        onDismissed: () {
          setState(() {
            showAssetDropdown = false;
          });
        },
        customDropdownButton: _buildAssetDropdownButton(),
        dropdownChild: _buildAssetDropdownChild(_scrollController),
        chevronIcon: null,
        hintText: 'Select an asset',
        selectedItem: null,
      ),
    );
  }

  /// Builds the asset dropdown button.
  Widget _buildAssetDropdownButton() {
    return Container(
      width: 310,
      height: 36,
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: RibnColors.whiteBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(4.7),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            showAssetDropdown = true;
          });
        },
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 270,
                  decoration: const BoxDecoration(
                    color: RibnColors.lightGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(1),
                      bottomRight: Radius.circular(1),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Container(
                    width: 31,
                    height: 30,
                    child: widget.chevronIcon,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1),
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(1),
                      ),
                      color: RibnColors.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AssetInfo(
                assetCode: widget.formattedSelectedAsset!['assetCode'],
                formattedAsset: widget.formattedSelectedAsset,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the asset dropdown widget.
  ///
  /// Allows user to select from the list of existing assets in the wallet, i.e. [widget.assets].
  Widget _buildAssetDropdownChild(ScrollController _scrollController) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: const Color(0xffeeeeee)),
      ),
      width: 310,
      constraints: const BoxConstraints(maxHeight: 86, minHeight: 0),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            padding: const EdgeInsets.all(0),
            shrinkWrap: false,
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: widget.assets
                .map(
                  (asset) => MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      widget.onSelected(asset);

                      setState(() {
                        showAssetDropdown = false;
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AssetInfo(
                        assetCode: asset.assetCode,
                        formattedAsset: widget.formattedAsset(asset),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
