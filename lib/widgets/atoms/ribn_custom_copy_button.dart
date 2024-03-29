// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_portal/flutter_portal.dart';

// Project imports:
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_copy_button.dart';

/// A button to copy [textToBeCopied] to [Clipboard] and display a confirmation bubble.
class RibnCustomCopyButton extends StatefulWidget {
  /// The text to be copied.
  final String textToBeCopied;

  /// Text to show in the bubble.
  final String bubbleText;

  final Widget icon;

  const RibnCustomCopyButton({
    Key? key,
    required this.textToBeCopied,
    this.bubbleText = 'Copied!',
    required this.icon,
  }) : super(key: key);

  @override
  State<RibnCustomCopyButton> createState() => _RibnCustomCopyButtonState();
}

class _RibnCustomCopyButtonState extends State<RibnCustomCopyButton> {
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
    return PortalTarget(
      visible: displayCopiedBubble,
      portalFollower: Container(
        width: 100,
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
      anchor: const Aligned(
        follower: Alignment.topCenter,
        target: Alignment.bottomCenter,
      ),
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
    );
  }
}
