import 'package:flutter/foundation.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: IntrinsicHeight(
        child: MaterialButton(
          elevation: 0,
          hoverElevation: 0,
          color: backgroundColor,
          child: IntrinsicWidth(
            child: Padding(
              padding: kIsWeb ? const EdgeInsets.fromLTRB(60, 50, 60, 80) : const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 80, child: icon),
                      SizedBox(
                        child: Text(
                          title,
                          style: RibnToolkitTextStyles.h1.copyWith(
                            color: RibnColors.lightGreyTitle,
                            fontSize: 18,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
            ),
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
      ),
    );
  }
}
