import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont13TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double textHeight;
  const RibnFont13TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.letterSpacing = 0,
      this.textHeight = 0})
      : super('', key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 13,
          height: textHeight,
          color: textColor,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
      textAlign: textAlignment,
    );
  }
}
