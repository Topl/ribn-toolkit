import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ribn_toolkit/constants/assets.dart';

import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/constants/ui_constants.dart';
import 'package:ribn_toolkit/transfer_utils.dart';
import 'package:ribn_toolkit/utils.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_dropdown.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/error_bubble.dart';

/// An input field used on the [MintInputPage], [AssetTransferInputPage] and [PolyTransferInputPage].
///
/// Allows the user to define the amount of asset to be minted/transfered and optionally a custom unit associated with it.
class AssetAmountField extends StatefulWidget {
  /// Controller for the amount textfield.
  final TextEditingController controller;

  /// The selected unit for the asset to be minted/transfered.
  final String? selectedUnit;

  /// Handler for when a unit is selected.
  final Function(String)? onUnitSelected;

  /// True if the unit type can be edited, e.g. when minting a new asset.
  final bool allowEditingUnit;

  /// True if unit needs to be displayed.
  final bool showUnit;

  /// The maximum amount that can be included in the tx.
  final num maxTransferrableAmount;

  /// Conditionally add an icon for the dropdown
  final Image? chevronIcon;

  final Function(String)? onChanged;

  const AssetAmountField({
    Key? key,
    this.onUnitSelected,
    required this.controller,
    this.allowEditingUnit = true,
    this.selectedUnit,
    this.showUnit = true,
    this.chevronIcon,
    this.maxTransferrableAmount = double.infinity,
    this.onChanged,
  }) : super(key: key);

  @override
  _AssetAmountFieldState createState() => _AssetAmountFieldState();
}

class _AssetAmountFieldState extends State<AssetAmountField> {
  /// True if the amount entered is invalid.
  bool hasError = false;

  /// True if error bubble needs to be displayed.
  bool displayErrorBubble = false;

  /// Timer for displaying the error message bubble.
  Timer? errorTimer;

  /// True if dropdown needs to be displayed.
  bool showUnitDropdown = false;

  /// True if dropdown arrow needs to be displayed.
  bool showDropdownArrow = false;

  @override
  void dispose() {
    errorTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AssetAmountField oldWidget) {
    // Validate amount again bc maxTransferrableAmount could change if a different asset is selected from the dropdown
    if (oldWidget.maxTransferrableAmount != widget.maxTransferrableAmount) {
      setState(() {
        hasError = !TransferUtils.validateAmount(
          widget.controller.text,
          widget.maxTransferrableAmount,
        );
        displayErrorBubble = false;
        errorTimer?.cancel();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    const double _fieldHeight = 36;

    return CustomInputField(
      itemLabel: Strings.amount,
      item: Stack(
        children: [
          Focus(
            onFocusChange: handleFocusChange,
            child: PortalEntry(
              visible: displayErrorBubble,
              child: CustomTextField(
                height: _fieldHeight,
                controller: widget.controller,
                hintText: Strings.amountHint,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hasError: hasError,
                onChanged: widget.onChanged,
              ),
              portal: const ErrorBubble(
                inverted: true,
                errorText: Strings.invalidAmountError,
              ),
              portalAnchor: Alignment.topRight,
              childAnchor: Alignment.bottomRight,
            ),
          ),
          _buildUnitDisplay(),
        ],
      ),
      tooltipIcon: Image.asset(
        RibnAssets.greyHelpBubble,
        width: 18,
      ),
    );
  }

  /// Shows associated unit if [widget.showUnit] is true.
  ///
  /// Allows selecting from the unit dropdown if [widget.allowEditingUnit] is true.
  Widget _buildUnitDisplay() {
    const double _fieldHeight = 36;

    return widget.showUnit
        ? widget.allowEditingUnit
            ? Positioned(
                right: -3,
                child: SizedBox(
                  height: 36,
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
              )
        : const SizedBox();
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
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Scrollbar(
            isAlwaysShown: true,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: UIConstants.assetUnitsList
                  .map(
                    (unit) => MaterialButton(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(unit,
                            style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(color: RibnColors.defaultText)),
                      ),
                      onPressed: () {
                        widget.onUnitSelected!(unit);
                        setState(() {
                          showUnitDropdown = false;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Handler for when focus is lost from the textfield.
  ///
  /// If the textfield has an invalid amount at the time of losing focus,
  /// the error message is displayed.
  void handleFocusChange(bool gotFocus) {
    final bool isAmountValid = TransferUtils.validateAmount(
      widget.controller.text,
      widget.maxTransferrableAmount,
    );
    // if focus is lost and a invalid address entered
    if (!gotFocus && !isAmountValid) {
      setState(() {
        hasError = true;
        displayErrorBubble = true;
      });
      errorTimer = Timer(const Duration(seconds: 3), () {
        setState(() {
          displayErrorBubble = false;
        });
      });
    } else {
      setState(() {
        hasError = false;
        displayErrorBubble = false;
        errorTimer?.cancel();
      });
    }
  }
}
