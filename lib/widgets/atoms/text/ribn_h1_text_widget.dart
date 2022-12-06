import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H1
class RibnH1TextWidget extends Text {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double height;
  const RibnH1TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight,
      required this.letterSpacing,
      required this.height}) : super('');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 36,
          fontWeight: fontWeight,
          height: height,
          letterSpacing: letterSpacing,
          color: textColor),
      textAlign: textAlign,
    );
  }
}
