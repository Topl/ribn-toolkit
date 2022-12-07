import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnH3TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  const RibnH3TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.letterSpacing = 0})
      : super('', key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 23,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor),
      textAlign: textAlignment,
    );
  }
}
