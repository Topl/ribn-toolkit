import 'package:flutter/cupertino.dart';
import '../../../constants/styles.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnH5TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;

  const RibnH5TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight,
      required this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 18,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor),
      textAlign: textAlign,
    );
  }
}
