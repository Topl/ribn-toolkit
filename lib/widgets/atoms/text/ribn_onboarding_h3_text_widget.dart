import 'package:flutter/cupertino.dart';
import '../../../constants/styles.dart';

/// @dev This widget is to be used by any other widget thats wants to use H1
class RibnOnboardingH3TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  const RibnOnboardingH3TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: RibnToolkitTextStyles.onboardingH3.copyWith(
        color: textColor,
      ),
      textAlign: textAlign,
    );
  }
}
