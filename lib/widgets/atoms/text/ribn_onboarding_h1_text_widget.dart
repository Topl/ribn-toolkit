import 'package:flutter/cupertino.dart';
import '../../../constants/styles.dart';

/// @dev This widget is to be used by any other widget thats wants to use H1
class RibnOnboardingH1TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final double letterSpacing;
  final double textHeight;
  const RibnOnboardingH1TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      this.letterSpacing = 0,
      this.textHeight = 0})
      : super('', key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: RibnToolkitTextStyles.onboardingH1.copyWith(
          color: textColor, letterSpacing: letterSpacing, height: textHeight),
      textAlign: textAlignment,
    );
  }
}
