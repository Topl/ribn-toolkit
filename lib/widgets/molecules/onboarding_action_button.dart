import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class OnboardingActionButton extends StatelessWidget {
  const OnboardingActionButton({
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
    this.lineHeight = 2.5,
    this.containerHeight = 218,
    this.containerWidth = 350,
    Key? key,
  }) : super(key: key);

  /// Background color of the container
  final Color backgroundColor;

  /// Leading icon
  final Image icon;

  /// Title shown next to the icon
  final String title;

  /// Description shown in the container
  final String description;

  /// Callback for when button is pressed
  final VoidCallback onPressed;

  /// Lineheight of the title
  final double lineHeight;

  /// Optional container height
  final double containerHeight;

  /// Optional container width
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: RibnColors.whiteButtonShadow,
            spreadRadius: 0,
            blurRadius: 22,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        color: backgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 80, child: icon),
                SizedBox(
                  child: Text(
                    title,
                    textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                    style: RibnToolkitTextStyles.h1.copyWith(
                      color: RibnColors.lightGreyTitle,
                      fontSize: 19.5,
                      height: lineHeight,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                description,
                style: RibnToolkitTextStyles.h3.copyWith(
                  fontSize: 18,
                  color: RibnColors.lightGreyTitle,
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
        hoverColor: RibnColors.primaryButtonHover,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
