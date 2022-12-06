import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnH4TextWidget extends Text {
  final String text;
  @override
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;

  const RibnH4TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight,
      required this.letterSpacing}) : super('');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 21,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor),
      textAlign: textAlign,
    );
  }
}
