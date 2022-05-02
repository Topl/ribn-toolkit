import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A custom styled large button used on several screens, e.g. login, asset transfer, and mint screens.
class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.buttonChild,
    required this.onPressed,
    this.backgroundColor = RibnColors.primary,
    this.hoverColor = RibnColors.primaryButtonHover,
    this.dropShadowColor = RibnColors.primaryButtonShadow,
    this.borderColor = Colors.transparent,
    this.buttonWidth = 310,
    this.buttonHeight = 43,
    Key? key,
  }) : super(key: key);
  final dynamic buttonChild;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color hoverColor;
  final Color dropShadowColor;
  final Color borderColor;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: dropShadowColor,
            spreadRadius: 0,
            blurRadius: 22,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        color: backgroundColor,
        child: buttonChild,
        onPressed: onPressed,
        hoverColor: hoverColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
            side: BorderSide(color: borderColor)),
      ),
    );
  }
}
