import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/assets.dart';

import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/constants/ui_constants.dart';
import 'package:ribn_toolkit/utils.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_dropdown.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';

/// An input field used on the [MintInputPage] and [AssetTransferInputPage].
///
/// Allows the user to define the amount of asset to be minted/transfered and a custom unit associated with it.
class AssetAmountField extends StatefulWidget {
  /// Controller for the amount textfield.
  final TextEditingController controller;

  /// The selected unit for the asset to be minted/transfered.
  final String? selectedUnit;

  /// Handler for when a unit is selected.
  final Function(String) onUnitSelected;

  /// True if the unit type can be edited, e.g. when minting a new asset.
  final bool allowEditingUnit;

  /// Conditionally add an icon for the dropdown
  final Image? chevronIcon;

  const AssetAmountField({
    Key? key,
    required this.onUnitSelected,
    required this.controller,
    this.allowEditingUnit = true,
    this.selectedUnit,
    this.chevronIcon,
  }) : super(key: key);

  @override
  _AssetAmountFieldState createState() => _AssetAmountFieldState();
}

class _AssetAmountFieldState extends State<AssetAmountField> {
  /// True if dropdown needs to be displayed.
  bool showUnitDropdown = false;

  final double _fieldHeight = 36;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      itemLabel: Strings.amount,
      item: Stack(
        children: [
          // textfield for entering the asset amount
          CustomTextField(
            height: _fieldHeight,
            controller: widget.controller,
            hintText: Strings.amountHint,
          ),
          // show dropdown for selecting a custom unit if [widget.allowEditingUnit] is true.
          // otherwise show the unit already associated with the asset.
          widget.allowEditingUnit
              ? Positioned(
                  right: -3,
                  top: 1,
                  child: CustomDropDown(
                    visible: showUnitDropdown,
                    onDismissed: () {
                      setState(() {
                        showUnitDropdown = false;
                      });
                    },
                    childAlignment: Alignment.bottomLeft,
                    dropDownAlignment: Alignment.topCenter,
                    chevronIcon: widget.chevronIcon,
                    dropdownChild: _buildUnitDropdownChild(),
                    selectedItem: widget.selectedUnit != null
                        ? Text(
                            formatAssetUnit(widget.selectedUnit),
                            style: RibnToolkitTextStyles.dropdownButtonStyle,
                          )
                        : null,
                    hintText: 'Select Unit',
                  ),
                )
              : Positioned(
                  right: 0,
                  top: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      padding: const EdgeInsets.all(2),
                      width: 120,
                      height: _fieldHeight - 10,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: RibnColors.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          formatAssetUnit(widget.selectedUnit),
                          style: RibnToolkitTextStyles.dropdownButtonStyle,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
      tooltipIcon: Image.asset(
        RibnAssets.greyHelpBubble,
        width: 18,
      ),
    );
  }

  /// Builds the Unit dropdown widget.
  ///
  /// Allows user to select from a list of custom units, i.e. [UIConstants.assetUnitsList].
  Widget _buildUnitDropdownChild() {
    return Padding(
      padding: const EdgeInsets.only(left: 138.0),
      child: Container(
        width: 120,
        height: 148,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: RibnColors.lightGrey, width: 1),
          color: const Color(0xffffffff),
          boxShadow: const [
            BoxShadow(
              color: RibnColors.blackShadow,
              spreadRadius: 0,
              blurRadius: 22.4,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ListView(
          children: UIConstants.assetUnitsList
              .map(
                (unit) => MaterialButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(unit,
                        style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(color: RibnColors.defaultText)),
                  ),
                  onPressed: () {
                    widget.onUnitSelected(unit);
                    setState(() {
                      showUnitDropdown = false;
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
