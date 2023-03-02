// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:flutter_portal/flutter_portal.dart';
// Project imports:
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/transfer_utils.dart';
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

  // The error string to show
  final String? errorString;

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
    this.errorString,
  }) : super(key: key);

  @override
  State<AssetAmountField> createState() => _AssetAmountFieldState();
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
    // Validate amount again bc maxTransferableAmount could change if a different asset is selected from the dropdown
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
    const double fieldHeight = 36;

    final String errorString = widget.errorString ?? Strings.invalidAmountError;

    return CustomInputField(
      itemLabel: Strings.amount,
      item: Stack(
        children: [
          Focus(
            onFocusChange: handleFocusChange,
            child: PortalTarget(
              visible: displayErrorBubble,
              portalFollower: ErrorBubble(
                inverted: true,
                errorText: errorString,
              ),
              closeDuration: Duration(seconds: 2),
              anchor: const Aligned(
                follower: Alignment.topRight,
                target: Alignment.bottomRight,
              ),
              child: CustomTextField(
                height: fieldHeight,
                controller: widget.controller,
                hintText: Strings.amountHint,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hasError: hasError,
                onChanged: widget.onChanged,
                hintColor: RibnColors.hintTextColor,
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
