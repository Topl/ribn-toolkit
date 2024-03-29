// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/utils.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/error_bubble.dart';

/// An input field used on the input transfer pages.
///
/// Allows the user to enter a recipient address.
class RecipientField extends StatefulWidget {
  /// Controller for the recipient textfield.
  final TextEditingController controller;

  /// Holds the recipient address if valid.
  final String validRecipientAddress;

  /// True if minting to own wallet.
  final bool mintingToMyWallet;

  /// Handler for when the text changes.
  final Function(String)? onChanged;

  /// Handler for when backspace is pressed.
  final Function onBackspacePressed;

  /// The icon to display at the start of the field.
  final SvgPicture icon;

  /// This is rendered instead of the CustomTextField if mintingToMyWallet
  final Widget alternativeDisplayChild;

  const RecipientField({
    Key? key,
    required this.controller,
    required this.validRecipientAddress,
    this.mintingToMyWallet = false,
    this.onChanged,
    required this.onBackspacePressed,
    required this.icon,
    required this.alternativeDisplayChild,
  }) : super(key: key);

  bool isValidRecipient() => validRecipientAddress.isNotEmpty;

  bool isTextFieldEmpty() => controller.text.isEmpty;

  @override
  State<RecipientField> createState() => _RecipientFieldState();
}

class _RecipientFieldState extends State<RecipientField> {
  /// True if the recipient entered is invalid.
  bool hasError = false;

  /// True if error bubble needs to be displayed.
  bool displayErrorBubble = false;

  /// Timer for displaying the error message bubble.
  Timer? errorTimer;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> formFieldState) => CustomInputField(
        itemLabel: Strings.to,
        item: widget.mintingToMyWallet
            ? widget.alternativeDisplayChild
            : Stack(
                children: [
                  Focus(
                    onFocusChange: handleFocusChange,
                    onKey: (focusNode, rawKeyEvent) {
                      // listen for backspace and call handler
                      if (rawKeyEvent.isKeyPressed(LogicalKeyboardKey.backspace)) {
                        widget.onBackspacePressed();
                      }
                      return KeyEventResult.ignored;
                    },
                    child: PortalTarget(
                      visible: displayErrorBubble,
                      portalFollower: const ErrorBubble(
                        errorText: Strings.invalidRecipientAddressError,
                      ),
                      anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
                      child: CustomTextField(
                        height: 36,
                        controller: widget.controller,
                        hintText: Strings.assetTransferToHint,
                        onChanged: widget.onChanged,
                        showCursor: !widget.isValidRecipient(),
                        hasError: hasError,
                        hintColor: RibnColors.hintTextColor,
                      ),
                    ),
                  ),
                  widget.isValidRecipient() ? _buildValidAddressDisplay() : const SizedBox(),
                ],
              ),
        tooltipIcon: Image.asset(
          RibnAssets.greyHelpBubble,
          width: 18,
        ),
      ),
    );
  }

  /// Builds a custom display for a valid address in the recipient field.
  Widget _buildValidAddressDisplay() {
    return Positioned(
      top: 3,
      left: 3,
      child: Container(
        width: 250,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xffefefef),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 7),
              child: SizedBox(width: 19, height: 19, child: widget.icon),
            ),
            Text(
              formatAddrString(widget.validRecipientAddress),
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 12,
                color: RibnColors.defaultText,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Handler for when focus is lost from the textfield.
  ///
  /// If the textfield has an invalid address at the time of losing focus,
  /// the error message is displayed.
  void handleFocusChange(bool gotFocus) {
    final bool invalidAddressEntered = !widget.isTextFieldEmpty() && !widget.isValidRecipient();
    // if focus is lost and a invalid address entered
    if (!gotFocus && invalidAddressEntered) {
      setState(() {
        hasError = true;
        displayErrorBubble = true;
      });
      errorTimer = Timer(const Duration(seconds: 2), () {
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
