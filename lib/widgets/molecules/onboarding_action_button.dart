// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
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
      child: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        color: backgroundColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 413,
          ),
          child: Padding(
            padding: kIsWeb
                ? const EdgeInsets.fromLTRB(60, 30, 30, 80)
                : const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x408AE2CF),
                            spreadRadius: 0,
                            blurRadius: 24.13,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      width: 40,
                      child: icon,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 8),
                        child: Text(
                          title,
                          style: RibnToolkitTextStyles.h1.copyWith(
                            color: RibnColors.lightGreyTitle,
                            fontSize: 23,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  description,
                  style: RibnToolkitTextStyles.h3.copyWith(
                    fontSize: 18,
                    color: RibnColors.lightGreyTitle,
                    height: 2,
                    fontWeight: FontWeight.w400,
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
    );
  }
}
