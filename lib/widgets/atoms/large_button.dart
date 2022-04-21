import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A custom styled large button used on several screens, e.g. login, asset transfer, and mint screens.
class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.buttonChild,
    required this.onPressed,
    this.backgroundColor = RibnColors.primary,
    this.buttonWidth = 310,
    this.buttonHeight = 43,
    Key? key,
  }) : super(key: key);
  final dynamic buttonChild;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: MaterialButton(
        elevation: 0,
        color: backgroundColor,
        child: buttonChild,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    );
  }
}
