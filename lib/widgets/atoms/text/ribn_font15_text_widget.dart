import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont15TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final double textHeight;
  const RibnFont15TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.wordSpacing = 0,
      this.textHeight = 0})
      : super('', key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          height: textHeight,
          fontFamily: 'DM Sans',
          fontSize: 15,
          color: textColor,
          fontWeight: fontWeight,
          wordSpacing: wordSpacing),
      textAlign: textAlignment,
    );
  }
}
