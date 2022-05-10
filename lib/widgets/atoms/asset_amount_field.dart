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

  /// The link to render the down arrow chevron
  final String chevronIconLink;

  const AssetAmountField({
    Key? key,
    required this.onUnitSelected,
    required this.controller,
    this.allowEditingUnit = true,
    this.selectedUnit,
    required this.chevronIconLink,
  }) : super(key: key);

  @override
  _AssetAmountFieldState createState() => _AssetAmountFieldState();
}

class _AssetAmountFieldState extends State<AssetAmountField> {
  /// True if dropdown needs to be displayed.
  bool showUnitDropdown = false;

  final double _fieldHeight = 30;

  @override
  Widget build(BuildContext context) {
    final double textFieldWidth = widget.allowEditingUnit ? 116 : 82;

    return CustomInputField(
      itemLabel: Strings.amount,
      item: Stack(
        children: [
          // textfield for entering the asset amount
          CustomTextField(
            width: textFieldWidth,
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
                    dropdownButton: _buildUnitDropdownButton(),
                    dropdownChild: _buildUnitDropdownChild(),
                  ),
                )
              : Positioned(
                  right: 2,
                  top: 6,
                  child: SizedBox(
                    width: 26,
                    child: Center(
                      child: Text(
                        formatAssetUnit(widget.selectedUnit),
                        style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(color: RibnColors.primary),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  /// Builds the Unit dropdown button.
  ///
  /// If [showDropdownArrow] is true, a drop down arrow is also displayed.
  Widget _buildUnitDropdownButton() {
    return MaterialButton(
      minWidth: 0,
      onPressed: () {
        setState(() {
          // show dropdown if unit can be edited.
          showUnitDropdown = widget.allowEditingUnit;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            width: 26,
            height: _fieldHeight - 10,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(1),
                bottomRight: Radius.circular(1),
                bottomLeft: Radius.circular(5),
              ),
              color: RibnColors.lightGrey,
            ),
            child: Center(
              child: Text(
                formatAssetUnit(widget.selectedUnit),
                style: RibnToolkitTextStyles.dropdownButtonStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Container(
              width: 20,
              height: _fieldHeight - 10,
              child: widget.allowEditingUnit
                  ? Image.asset(
                      widget.chevronIconLink,
                      width: 24,
                    )
                  : null,
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
    );
  }

  /// Builds the Unit dropdown widget.
  ///
  /// Allows user to select from a list of custom units, i.e. [UIConstants.assetUnitsList].
  Widget _buildUnitDropdownChild() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        width: 115,
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
