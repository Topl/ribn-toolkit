import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A button to copy [textToBeCopied] to [Clipboard] and display a confirmation bubble.
class CustomCopyButton extends StatefulWidget {
  /// The text to be copied.
  final String textToBeCopied;

  /// Text to show in the bubble.
  final String bubbleText;

  final Image icon;

  const CustomCopyButton({
    Key? key,
    required this.textToBeCopied,
    this.bubbleText = 'Copied!',
    required this.icon,
  }) : super(key: key);

  @override
  _CustomCopyButtonState createState() => _CustomCopyButtonState();
}

class _CustomCopyButtonState extends State<CustomCopyButton> {
  /// Timer for showing the copied indicator.
  Timer? copiedTimer;

  /// True if address has been copied and bubble needs to be displayed.
  bool displayCopiedBubble = false;

  @override
  void dispose() {
    copiedTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PortalEntry(
      visible: displayCopiedBubble,
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: widget.textToBeCopied));
          setState(() {
            displayCopiedBubble = true;
          });
          copiedTimer = Timer(const Duration(seconds: 2), () {
            setState(() {
              displayCopiedBubble = false;
            });
          });
        },
        child: widget.icon,
      ),
      portal: Container(
        width: 138,
        height: 36,
        decoration: const BoxDecoration(
          color: Color(0xfffefffe),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 10),
              child: Image.asset(RibnAssets.addressCopiedIcon),
            ),
            Text(
              widget.bubbleText,
              style: RibnToolkitTextStyles.smallBody,
            ),
          ],
        ),
      ),
      portalAnchor: Alignment.topCenter,
      childAnchor: Alignment.bottomCenter,
    );
  }
}
